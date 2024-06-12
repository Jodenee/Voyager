local Webhook = {}
Webhook.__index = Webhook

local Message = require(script.Parent.Message)
local EditedMessage = require(script.Parent.EditedMessage)
local ThreadMessage = require(script.Parent.ThreadMessage)
local EditedThreadMessage = require(script.Parent.EditedThreadMessage)
local OptionalExecuteInfo = require(script.Parent.OptionalExecuteInfo)

export type RatelimitInformation = {
	Limit : number,
	Remaining : number,
	Reset : DateTime,
	ResetAfter : number, -- In seconds.
	ResetAfterSafe : number,
	Bucket : string,
}

export type RatelimitedInformation = {
	Scope : string,
	RetryAfter : number, -- In milliseconds since proxy uses v6 of the Discord API.
	RetryAfterSafe : number
}

export type RequestStatus = {
	Success : boolean,
	StatusCode : number,
	StatusMessage : string,
	Message : string?,
	Reason : string?
}

function Webhook.new(id : string, token : string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)

	self.Id = id
	self.Token = token
	self.BaseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.Id .. "/" .. self.Token

	return self
end

function Webhook.FromUrl(webhookUrl: string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)
	local webhookId, webhookToken = string.match(webhookUrl, "^https://discord.com/api/webhooks/(%d+)/([%w%p]+)$")

	if (not webhookId) or (not webhookToken) then
		error("Invalid webhook url.")
	end

	self.Id = webhookId
	self.Token = webhookToken
	self.BaseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.Id .. "/" .. self.Token

	return self
end

function Webhook:_ValidateExecuteRequest(content : string?, embeds : {}?, optionalExecuteInfo) : (boolean, string?)
	if (not content or content == "") and (not embeds or #embeds == 0) then
		return false, "one of content, embeds are required."
	end

	if content then
		if string.len(content) > 2000 then
			return false, "The content must only contain up to 2000 characters."
		end
	end

	if optionalExecuteInfo.usernameOverride then
		local restrictedUsernames = {"everyone", "here"}
		local restrictedSubStrings = {"discord", "clyde", "```"}
		local loweredUsername = optionalExecuteInfo.UsernameOverride:lower()

		for _, restrictedUsername in restrictedUsernames do	
			if loweredUsername == restrictedUsername then return false, "Username override is a restricted username. \"" .. restrictedUsername .. "\"" end
		end

		for _, restrictedSubString in restrictedSubStrings do	
			if loweredUsername:match(restrictedSubString) then return false, "Username override contains a restricted substring. \"" .. restrictedSubString .. "\"" end
		end

		if string.len(optionalExecuteInfo.UsernameOverride) < 1 or string.len(optionalExecuteInfo.UsernameOverride) > 80 then
			return false, "Username override must be between 1 and 80 characters in length."
		end
	end

	if optionalExecuteInfo.ThreadId and optionalExecuteInfo.ThreadName then
		return false, "threadId and threadName cannot be used together."
	end

	if embeds then
		local totalEmbedCharacters = 0

		if #embeds > 10 then
			return false, "A single message must only have up to 10 embeds." 
		end

		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_Validate()
			if not isEmbedValid then return false, errorMessage end

			totalEmbedCharacters += embed:TotalCharacters()
		end

		if totalEmbedCharacters > 6000 then return false, "The combined sum of characters across all embeds attached to a message must only be up to 6000 characters." end
	end

	return true
end

function Webhook:_ValidateEditMessageRequest(content : string?, embeds : {}?) : (boolean, string?)
	if content then
		if string.len(content) > 2000 then
			return false, "The content must only contain up to 2000 characters."
		end
	end

	if embeds then
		local totalEmbedCharacters = 0

		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_Validate()
			if not isEmbedValid then return false, errorMessage end

			totalEmbedCharacters += embed:TotalCharacters()
		end

		if totalEmbedCharacters > 6000 then return false, "The combined sum of characters across all embeds attached to a message must only be up to 6000 characters." end
	end

	return true
end

function Webhook:_Request(url : string, method : string, body : {}?, contentType : string?) : ({}?, RequestStatus, RatelimitInformation | RatelimitedInformation | {})
	local httpService = game:GetService("HttpService")

	local response = httpService:RequestAsync({
		Url = url,
		Method = method,
		Headers = {["Content-Type"] = contentType},
		Body = httpService:JSONEncode(body)
	})
	local responseHeaders : {} = response.Headers
	local decodedBody : {} = {}
	local ratelimitInformation : RatelimitInformation | RatelimitedInformation | {} = {}
	local wasRequestQueued : boolean = false

	if response.Body ~= "" then
		decodedBody = httpService:JSONDecode(response.Body)
		wasRequestQueued = decodedBody.proxy
	end

	if response.Success and not wasRequestQueued then
		ratelimitInformation = {
			Limit = tonumber(responseHeaders["x-ratelimit-limit"]),
			Remaining = tonumber(responseHeaders["x-ratelimit-remaining"]),
			Reset = DateTime.fromUnixTimestamp(tonumber(responseHeaders["x-ratelimit-reset"])),
			ResetAfter = tonumber(responseHeaders["x-ratelimit-reset-after"]),
			ResetAfterSafe = responseHeaders["x-ratelimit-reset-after"] + 1,
			Bucket = responseHeaders["x-ratelimit-bucket"]
		} :: RatelimitInformation
	elseif response.StatusCode == 429 and not wasRequestQueued then
		ratelimitInformation = {
			Scope = responseHeaders["x-ratelimit-scope"] or "global", -- The only time scope is not returned is when a webhook gets cloudflare ratelimited which counts as global.
			RetryAfter = tonumber(responseHeaders["retry-after"]),
			RetryAfterSafe = responseHeaders["retry-after"] + 1000
		} :: RatelimitedInformation
	end

	local requestStatus : RequestStatus = {
		Success = response.Success,
		StatusCode = response.StatusCode,
		StatusMessage = response.StatusMessage,
		Message = decodedBody.message,
		Reason = decodedBody.reason
	}

	return decodedBody, requestStatus, ratelimitInformation
end

function Webhook:Execute(content : string?, embeds : {}?, queue : boolean, waitForMessage : boolean, optionalExecuteInfo) : ({}?, RequestStatus, RatelimitInformation | RatelimitedInformation | {})
	local executeInfo = optionalExecuteInfo or OptionalExecuteInfo.new()
	local isRequestValid, errorMessage = self:_ValidateExecuteRequest(content, embeds, executeInfo)
	if not isRequestValid then return error(errorMessage) end

	if queue == nil then queue = true end
	if waitForMessage == nil then waitForMessage = false end

	local requestUrl = self.BaseUrl
	local embedObjects = {}
	local requestBody = {
		content = content,
		username = executeInfo.UsernameOverride,
		avatar_url = executeInfo.AvatarOverride,
		tts = executeInfo.TTS,
		embeds = embedObjects,
		flags = executeInfo.MessageFlags.Value,
		thread_name = executeInfo.ThreadName
	}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	if queue then requestUrl ..= "/queue" end
	requestUrl ..= "?wait=" .. tostring(waitForMessage)
	if executeInfo.ThreadId then requestUrl ..= "&thread_id=" .. executeInfo.ThreadId end

	local responseBody, requestStatus, requestRatelimitInfo = self:_Request(requestUrl, "POST", requestBody, "application/json")

	if not queue and waitForMessage and requestStatus.Success then
		if not executeInfo.threadId then
			return Message.new(responseBody), requestStatus, requestRatelimitInfo
		else
			return ThreadMessage.new(responseBody), requestStatus, requestRatelimitInfo
		end
	end

	return nil, requestStatus, requestRatelimitInfo
end

function Webhook:EditMessage(messageId : string, content : string?, embeds : {}?, threadId : string?) : ({}?, RequestStatus, RatelimitInformation | RatelimitedInformation)
	local isRequestValid, errorMessage = self:_ValidateEditMessageRequest(content, embeds)
	if not isRequestValid then return error(errorMessage) end

	local requestUrl = self.BaseUrl .. "/messages/" .. messageId
	local embedObjects = {}
	local requestBody = {
		content = content,
		embeds = embedObjects
	}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	if threadId then requestUrl ..= "?thread_id=" .. threadId end

	local responseBody, requestStatus, requestRatelimitInfo = self:_Request(requestUrl, "PATCH", requestBody, "application/json")

	if not requestStatus.Success then return nil, requestStatus end

	if not threadId then
		return EditedMessage.new(responseBody), requestStatus, requestRatelimitInfo
	else
		return EditedThreadMessage.new(responseBody), requestStatus, requestRatelimitInfo
	end
end

function Webhook:DeleteMessage(messageId : string, threadId : string?) : (RequestStatus, RatelimitInformation | RatelimitedInformation)
	local requestUrl = self.BaseUrl .. "/messages/" .. messageId

	if threadId then requestUrl ..= "?thread_id=" .. threadId end

	local _, requestStatus, requestRatelimitInfo = self:_Request(requestUrl, "DELETE")

	return requestStatus, requestRatelimitInfo
end

return Webhook