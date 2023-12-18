local Webhook = {}
Webhook.__index = Webhook

local Message = require(script.Parent.Message)
local EditedMessage = require(script.Parent.EditedMessage)
local ThreadMessage = require(script.Parent.ThreadMessage)
local EditedThreadMessage = require(script.Parent.EditedThreadMessage)
local OptionalExecuteInfo = require(script.Parent.OptionalExecuteInfo)

type RatelimitInfo = {
	XRatelimitLimit : number?,
	XRatelimitRemaining : number?,
	XRatelimitReset : string?,
	XRatelimitResetAfter : number?,
	XRatelimitBucket : string?
}

type RatelimitInformation = {
	limit : number,
	remaining : number,
	reset : string,
	resetAfter : number,
	resetAfterSafe : number,
	bucket : string,
	global : boolean?,
	scope : string?
}

type RequestStatus = {
	success : boolean,
	statusCode : number,
	statusMessage : string
}

function Webhook.new(id : string, token : string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)

	self.id = id
	self.token = token
	self.baseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.id .. "/" .. self.token
	self.ratelimitInfo = {} :: RatelimitInfo

	return self
end

function Webhook.fromUrl(webhookUrl: string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)
	local webhookId, webhookToken = string.match(webhookUrl, "^https://discord.com/api/webhooks/(%d+)/([%w%p]+)$")
	
	if (not webhookId) or (not webhookToken) then
		error("Invalid webhook url.")
	end
	
	self.id = webhookId
	self.token = webhookToken
	self.baseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.id .. "/" .. self.token
	self.ratelimitInfo = {} :: RatelimitInfo

	return self
end

function Webhook:_validateExecuteRequest(content : string?, embeds : {}?, optionalExecuteInfo) : (boolean, string?)
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
		local loweredUsername = optionalExecuteInfo.usernameOverride:lower()

		for _, restrictedUsername in restrictedUsernames do	
			if loweredUsername == restrictedUsername then return false, "Username override is a restricted username. \"" .. restrictedUsername .. "\"" end
		end

		for _, restrictedSubString in restrictedSubStrings do	
			if loweredUsername:match(restrictedSubString) then return false, "Username override contains a restricted substring. \"" .. restrictedSubString .. "\"" end
		end

		if string.len(optionalExecuteInfo.usernameOverride) < 1 or string.len(optionalExecuteInfo.usernameOverride) > 80 then
			return false, "Username override must be between 1 and 80 in length." 
		end
	end

	if optionalExecuteInfo.threadId and optionalExecuteInfo.threadName then
		return false, "threadId and threadName cannot be used together."
	end

	if embeds then
		local totalEmbedCharacters = 0
		
		if #embeds > 10 then 
			return false, "A single message must only have up to 10 embeds." 
		end 

		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_validate()
			if not isEmbedValid then return false, errorMessage end
			
			totalEmbedCharacters += embed:totalCharacters()
		end

		if totalEmbedCharacters > 6000 then return false, "The combined sum of characters across all embeds attached to a message must only be up to 6000 characters." end
	end

	return true
end

function Webhook:_validateEditMessageRequest(content : string?, embeds : {}?) : (boolean, string?)
	if content then
		if string.len(content) > 2000 then 
			return false, "The content must only contain up to 2000 characters." 
		end 
	end

	if embeds then
		local totalEmbedCharacters = 0

		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_validate()
			if not isEmbedValid then return false, errorMessage end

			totalEmbedCharacters += embed:totalCharacters()
		end

		if totalEmbedCharacters > 6000 then return false, "The combined sum of characters across all embeds attached to a message must only be up to 6000 characters." end
	end

	return true
end

function Webhook:_request(url : string, method : string, body : {}?, contentType : string?) : ({}?, RequestStatus, ratelimitInformation)
	local httpService = game:GetService("HttpService")
	
	local response = httpService:RequestAsync({
		Url = url,
		Method = method,
		Headers = {["Content-Type"] = contentType},
		Body = httpService:JSONEncode(body)
	})
	local responseHeaders = response.Headers

	self.ratelimitInfo = {
		XRatelimitLimit = tonumber(responseHeaders["x-ratelimit-limit"]),
		XRatelimitRemaining = tonumber(responseHeaders["x-ratelimit-remaining"]),
		XRatelimitReset = responseHeaders["x-ratelimit-reset"],
		XRatelimitResetAfter = tonumber(responseHeaders["x-ratelimit-reset-after"]),
		XRatelimitBucket = responseHeaders["x-ratelimit-bucket"]
	}
	
	local ratelimitInformation = {
		limit = tonumber(responseHeaders["x-ratelimit-limit"]),
		remaining = tonumber(responseHeaders["x-ratelimit-remaining"]),
		reset = responseHeaders["x-ratelimit-reset"],
		resetAfter = tonumber(responseHeaders["x-ratelimit-reset-after"]),
		resetAfterSafe = tonumber(responseHeaders["x-ratelimit-reset-after"]) + 1,
		bucket = responseHeaders["x-ratelimit-bucket"],
		global = responseHeaders["x-ratelimit-global"],
		scope = responseHeaders["x-ratelimit-scope"]		
	}
	
	local requestStatus : requestStatus = {
		success = response.Success, 
		statusCode = response.StatusCode, 
		statusMessage = response.StatusMessage
	}
	
	if not response.Success or response.Body == "" then
		return nil, requestStatus, ratelimitInformation 
	end	

	return httpService:JSONDecode(response.Body), requestStatus, ratelimitInformation
end

function Webhook:execute(content : string?, embeds : {}?, queue : boolean, waitForMessage : boolean, optionalExecuteInfo) : ({}?, RequestStatus, RatelimitInformation)
	local executeInfo = optionalExecuteInfo or OptionalExecuteInfo.new()
	local isRequestValid, errorMessage = self:_validateExecuteRequest(content, embeds, executeInfo)	
	if not isRequestValid then return error(errorMessage) end
	
	if queue == nil then queue = true end
	if waitForMessage == nil then waitForMessage = false end
	
	local requestUrl = self.baseUrl
	local requestBody = {
		content = content,
		username = executeInfo.usernameOverride,
		avatar_url = executeInfo.avatarOverride,
		tts = executeInfo.tts,
		embeds = embeds,
		flags = executeInfo.messageFlags.value,
		thread_name = executeInfo.threadName
	}
	
	if queue then requestUrl ..= "/queue" end
	requestUrl ..= "?wait=" .. tostring(waitForMessage)
	if executeInfo.threadId then requestUrl ..= "&thread_id=" .. executeInfo.threadId end

	local responseBody, requestStatus, requestRatelimitInfo = self:_request(requestUrl, "POST", requestBody, "application/json")

	if not queue and waitForMessage and requestStatus.success then
		if not executeInfo.threadId then 
			return Message.new(responseBody), requestStatus, requestRatelimitInfo
		else
			return ThreadMessage.new(responseBody), requestStatus, requestRatelimitInfo
		end
	end
	
	return nil, requestStatus, requestRatelimitInfo
end

function Webhook:editMessage(messageId : string, content : string?, embeds : {}?, threadId : string?) : ({}?, RequestStatus, RatelimitInformation)
	local isRequestValid, errorMessage = self:_validateEditMessageRequest(content, embeds)
	if not isRequestValid then return error(errorMessage) end
	
	local requestUrl = self.baseUrl .. "/messages/" .. messageId
	local requestBody = {
		content = content,
		embeds = embeds
	}

	if threadId then requestUrl ..= "?thread_id=" .. threadId end
	
	local responseBody, requestStatus, requestRatelimitInfo = self:_request(requestUrl, "PATCH", requestBody, "application/json")
	
	if not requestStatus.success then return nil, requestStatus end

	if not threadId then
		return EditedMessage.new(responseBody), requestStatus, requestRatelimitInfo
	else
		return EditedThreadMessage.new(responseBody), requestStatus, requestRatelimitInfo
	end
end

function Webhook:deleteMessage(messageId : string, threadId : string?) : (RequestStatus, RatelimitInformation)
	local requestUrl = self.baseUrl .. "/messages/" .. messageId

	if threadId then requestUrl ..= "?thread_id=" .. threadId end	
	
	local _, requestStatus, requestRatelimitInfo = self:_request(requestUrl, "DELETE")
	
	return requestStatus, requestRatelimitInfo
end

return Webhook