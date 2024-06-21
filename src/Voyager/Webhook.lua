local Webhook = {}
Webhook.__index = Webhook

local httpService = game:GetService("HttpService")

local Message = require(script.Parent.Message)
local EditedMessage = require(script.Parent.EditedMessage)
local ThreadMessage = require(script.Parent.ThreadMessage)
local EditedThreadMessage = require(script.Parent.EditedThreadMessage)
local OptionalSendMessageInfo = require(script.Parent.OptionalSendMessageInfo)

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

export type ProxyInformation = {
	Proxy: boolean,
	Message : string?,
	Reason : string?,
	Error : string?
}

export type RequestStatus = {
	Success : boolean,
	StatusCode : number,
	StatusMessage : string,
	ProxyInformation : ProxyInformation?,
	RatelimitInformation : (RatelimitInformation | RatelimitedInformation)?
}

function Webhook.new(id : string, token : string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)

	self.Id = id
	self.Token = token
	self.BaseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.Id .. "/" .. self.Token

	return self
end

function Webhook.FromUrl(webhookUrl : string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)
	local webhookId, webhookToken = string.match(webhookUrl, "^https://discord.com/api/webhooks/(%d+)/([%w%p]+)$")

	if (not webhookId) or (not webhookToken) then
		error("Could not parse webhook id and token from given webhook url \"" .. webhookUrl .. "\". Make sure the url is in the following format \"https://discord.com/api/webhooks/123/token\".")
	end

	self.Id = webhookId
	self.Token = webhookToken
	self.BaseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.Id .. "/" .. self.Token

	return self
end

function Webhook:_ValidateSendMessageRequest(content : string?, embeds : {}?, optionalSendMessageInfo : {}?) : (boolean, string?)
	if (not content or content == "") and (not embeds or #embeds == 0) then
		return false, "one of content, embeds are required."
	end

	if content then
		if string.len(content) > 2000 then
			return false, "The content must only contain up to 2000 characters."
		end
	end

	if optionalSendMessageInfo.UsernameOverride then
		local restrictedUsernames = {"everyone", "here"}
		local restrictedSubStrings = {"discord", "clyde", "```"}
		local loweredUsername = optionalSendMessageInfo.UsernameOverride:lower()

		for _, restrictedUsername in restrictedUsernames do
			if loweredUsername ~= restrictedUsername then continue end

			return false, "Username override is a restricted username \"" .. restrictedUsername .. "\"."
		end

		for _, restrictedSubString in restrictedSubStrings do
			if not loweredUsername:match(restrictedSubString) then continue end

			return false, "Username override contains a restricted substring \"" .. restrictedSubString .. "\"."
		end

		if string.len(optionalSendMessageInfo.UsernameOverride) < 1 or string.len(optionalSendMessageInfo.UsernameOverride) > 80 then
			return false, "Username override must be between 1 and 80 characters in length."
		end
	end

	if embeds then
		local totalEmbedCharacters = 0

		if #embeds > 10 then
			return false, "A single message can only have up to 10 embeds."
		end

		for index, embed in embeds do
			local isEmbedValid, errorMessage = embed:_Validate()
			if not isEmbedValid then
				return false, "Embeds[" .. index .. "]: " .. errorMessage
			end

			totalEmbedCharacters += embed:TotalCharacters()
		end

		if totalEmbedCharacters > 6000 then
			return false, "The combined sum of characters across all embeds attached to a message can only have up to 6000 characters."
		end
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

		for index, embed in embeds do
			local isEmbedValid, errorMessage = embed:_Validate()
			if not isEmbedValid then
				return false, "Embeds[" .. index .. "]: " .. errorMessage
			end

			totalEmbedCharacters += embed:TotalCharacters()
		end

		if totalEmbedCharacters > 6000 then
			return false, "The combined sum of characters across all embeds attached to a message can only have up to 6000 characters."
		end
	end

	return true
end

function Webhook:_Request(url : string, method : string, body : {}?, contentType : string?) : ({}?, RequestStatus)
	local response = httpService:RequestAsync({
		Url = url,
		Method = method,
		Headers = {
			["Content-Type"] = contentType
		},
		Body = httpService:JSONEncode(body)
	})
	local responseHeaders = response.Headers
	local decodedBody = nil
	local ratelimitInfo : (RatelimitInformation | RatelimitedInformation)?
	local proxyInfo : ProxyInformation?
	local wasRequestQueued = false

	if response.Success and response.StatusCode ~= 204 then
		decodedBody = httpService:JSONDecode(response.Body)
		wasRequestQueued = decodedBody.proxy

		proxyInfo = {
			Proxy = decodedBody.proxy,
			Message = decodedBody.message,
			Reason = decodedBody.reason,
			Error = decodedBody.error
		} :: ProxyInformation
	end

	if response.Success and not wasRequestQueued then
		ratelimitInfo = {
			Limit = tonumber(responseHeaders["x-ratelimit-limit"]),
			Remaining = tonumber(responseHeaders["x-ratelimit-remaining"]),
			Reset = DateTime.fromUnixTimestamp(tonumber(responseHeaders["x-ratelimit-reset"])),
			ResetAfter = tonumber(responseHeaders["x-ratelimit-reset-after"]),
			ResetAfterSafe = tonumber(responseHeaders["x-ratelimit-reset-after"]) + .5,
			Bucket = responseHeaders["x-ratelimit-bucket"]
		} :: RatelimitInformation
	elseif response.StatusCode == 429 and not wasRequestQueued then
		ratelimitInfo = {
			Scope = responseHeaders["x-ratelimit-scope"] or "global", -- The only time scope is not returned is when a webhook gets cloudflare ratelimited which counts as global.
			RetryAfter = tonumber(responseHeaders["retry-after"]),
			RetryAfterSafe = tonumber(responseHeaders["retry-after"]) + 500
		} :: RatelimitedInformation
	end

	local requestStatus : RequestStatus = {
		Success = response.Success,
		StatusCode = response.StatusCode,
		StatusMessage = response.StatusMessage,
		ProxyInformation = proxyInfo,
		RatelimitInformation = ratelimitInfo
	}

	return decodedBody, requestStatus
end

function Webhook:SendMessage(content : string?, embeds : {}?, queue : boolean?, waitForMessage : boolean?, optionalSendMessageInfo : {}?) : ({}?, RequestStatus)
	optionalSendMessageInfo = optionalSendMessageInfo or OptionalSendMessageInfo.new()

	local isRequestValid, errorMessage = self:_ValidateSendMessageRequest(content, embeds, optionalSendMessageInfo)
	if not isRequestValid then return error(errorMessage) end

	if queue == nil then queue = true end
	if waitForMessage == nil then waitForMessage = false end

	local embedObjects = {}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	local requestUrl = self.BaseUrl
	local requestBody = {
		content = content,
		username = optionalSendMessageInfo.UsernameOverride,
		avatar_url = optionalSendMessageInfo.AvatarOverride,
		tts = optionalSendMessageInfo.UseTTS,
		embeds = embedObjects,
		flags = optionalSendMessageInfo.MessageFlags.Value,
		thread_name = optionalSendMessageInfo.ThreadName
	}

	if queue then
		requestUrl ..= "/queue"
	end

	requestUrl ..= "?wait=" .. tostring(waitForMessage)

	local responseBody, requestStatus = self:_Request(requestUrl, "POST", requestBody, "application/json")

	if not queue and waitForMessage and requestStatus.Success then
		return Message.new(responseBody), requestStatus
	end

	return nil, requestStatus
end

function Webhook:SendMessageInThread(threadId : string, content : string?, embeds : {}?, queue : boolean?, waitForMessage : boolean?, optionalSendMessageInfo : {}?) : ({}?, RequestStatus)
	optionalSendMessageInfo = optionalSendMessageInfo or OptionalSendMessageInfo.new()

	local isRequestValid, errorMessage = self:_ValidateSendMessageRequest(content, embeds, optionalSendMessageInfo)
	if not isRequestValid then return error(errorMessage) end

	if queue == nil then queue = true end
	if waitForMessage == nil then waitForMessage = false end

	local embedObjects = {}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	local requestUrl = self.BaseUrl
	local requestBody = {
		content = content,
		username = optionalSendMessageInfo.UsernameOverride,
		avatar_url = optionalSendMessageInfo.AvatarOverride,
		tts = optionalSendMessageInfo.UseTTS,
		embeds = embedObjects,
		flags = optionalSendMessageInfo.MessageFlags.Value
	}

	if queue then
		requestUrl ..= "/queue"
	end

	requestUrl ..= "?wait=" .. tostring(waitForMessage)
	requestUrl ..= "&thread_id=" .. threadId

	local responseBody, requestStatus = self:_Request(requestUrl, "POST", requestBody, "application/json")

	if not queue and waitForMessage and requestStatus.Success then
		return ThreadMessage.new(responseBody), requestStatus
	end

	return nil, requestStatus
end

function Webhook:EditMessage(messageId : string, content : string?, embeds : {}?, queue : boolean?) : ({}?, RequestStatus)
	local isRequestValid, errorMessage = self:_ValidateEditMessageRequest(content, embeds)
	if not isRequestValid then return error(errorMessage) end

	local embedObjects = {}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	local requestUrl = self.BaseUrl .. "/messages/" .. messageId
	local requestBody = {
		content = content,
		embeds = embedObjects
	}

	local responseBody, requestStatus = self:_Request(requestUrl, "PATCH", requestBody, "application/json")

	if requestStatus.Success then
		return EditedMessage.new(responseBody), requestStatus
	end

	return nil, requestStatus
end

function Webhook:EditMessageInThread(threadId : string, messageId : string, content : string?, embeds : {}?) : ({}?, RequestStatus)
	local isRequestValid, errorMessage = self:_ValidateEditMessageRequest(content, embeds)
	if not isRequestValid then return error(errorMessage) end

	local embedObjects = {}

	if embeds then
		for _, embed in embeds do
			table.insert(embedObjects, embed:_ToObject())
		end
	end

	local requestUrl = self.BaseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	local requestBody = {
		content = content,
		embeds = embedObjects
	}

	local responseBody, requestStatus = self:_Request(requestUrl, "PATCH", requestBody, "application/json")

	if requestStatus.Success then
		return EditedThreadMessage.new(responseBody), requestStatus
	end

	return nil, requestStatus
end

function Webhook:DeleteMessage(messageId : string) : RequestStatus
	local requestUrl = self.BaseUrl .. "/messages/" .. messageId
	local _, requestStatus = self:_Request(requestUrl, "DELETE")

	return requestStatus
end

function Webhook:DeleteMessageInThread(threadId : string, messageId : string) : RequestStatus
	local requestUrl = self.BaseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	local _, requestStatus = self:_Request(requestUrl, "DELETE")

	return requestStatus
end

return Webhook