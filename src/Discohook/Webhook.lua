--!strict

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

function Webhook.new(id : string, token : string, customProxyUrl : string?)
	local self = setmetatable({}, Webhook)

	self.id = id
	self.token = token
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

	if embeds then 
		if #embeds > 10 then 
			return false, "A single message must only have up to 10 embeds." 
		end 
	end

	if optionalExecuteInfo then
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
	end	

	if embeds then
		local totalEmbedCharacters = 0

		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_validate()
			if not isEmbedValid then return false, errorMessage end
			
			totalEmbedCharacters += embed:totalCharacters()
		end

		if totalEmbedCharacters > 6000 then return false, "The combined sum of characters across all embeds attached to a message must only contain up to 6000 characters." end
	end

	return true
end

function Webhook:_request(url : string, method : string, body : {}?, contentType : string?) : {}?
	local httpService = game:GetService("HttpService")
	
	local response = httpService:RequestAsync({
		Url = url,
		Method = method,
		Headers = {["Content-Type"] = contentType},
		Body = httpService:JSONEncode(body)
	})
	
	self.ratelimitInfo = {
		XRatelimitLimit = tonumber(response["Headers"]["x-ratelimit-limit"]),
		XRatelimitRemaining = tonumber(response["Headers"]["x-ratelimit-remaining"]),
		XRatelimitReset = response["Headers"]["x-ratelimit-reset"],
		XRatelimitResetAfter = tonumber(response["Headers"]["x-ratelimit-reset-after"]),
		XRatelimitBucket = response["Headers"]["x-ratelimit-bucket"]
	}
	
	if not response.Success then return error("Status: " .. response.StatusCode .. " " .. response.StatusMessage) end	
	if response.Body == "" then return end
	
	return httpService:JSONDecode(response.Body)
end

function Webhook:execute(content : string?, embeds : {}?, queue : boolean, waitForMessage : boolean, optionalExecuteInfo)
	local executeInfo = optionalExecuteInfo or OptionalExecuteInfo.new()
	local isRequestValid, errorMessage = self:_validateExecuteRequest(content, embeds, executeInfo)	
	if not isRequestValid then return error(errorMessage) end

	local requestUrl
	local requestBody = {
		["content"] = content,
		["username"] = executeInfo.usernameOverride,
		["avatar_url"] = executeInfo.avatarOverride,
		["tts"] = executeInfo.tts,
		["embeds"] = {},
		["flags"] = executeInfo.messageFlags.value,
		["thread_name"] = executeInfo.threadName
	}

	if embeds then	
		for _, embed in embeds do
			table.insert(requestBody.embeds, embed)
		end
	end

	if queue then
		requestUrl = self.baseUrl .. "/queue?wait=" .. tostring(waitForMessage)
	else
		requestUrl = self.baseUrl .. "?wait=" .. tostring(waitForMessage)
	end

	if executeInfo.threadId then requestUrl ..= "&thread_id=" .. executeInfo.threadId end

	local responseBody = self:_request(requestUrl, "POST", requestBody, "application/json")

	if not queue and waitForMessage then
		if not executeInfo.threadId then 
			return Message.new(responseBody)
		else
			return ThreadMessage.new(responseBody)
		end
	end
end

function Webhook:editMessage(messageId : string, content : string?, embeds : {}?, threadId : string?)
	local requestUrl
	local requestBody = {
		["content"] = content,
		["embeds"] = {}
	}

	if embeds then	
		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_validate()
			if not isEmbedValid then error(errorMessage) end
			
			table.insert(requestBody.embeds, embed)
		end
	end

	if threadId then
		requestUrl = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	else
		requestUrl = self.baseUrl .. "/messages/" .. messageId
	end
	
	local responseBody = self:_request(requestUrl, "PATCH", requestBody, "application/json")

	if not threadId then
		return EditedMessage.new(responseBody)
	else
		return EditedThreadMessage.new(responseBody)
	end
end

function Webhook:deleteMessage(messageId : string, threadId : string?) : nil
	local requestUrl

	if threadId then
		requestUrl = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	else
		requestUrl = self.baseUrl .. "/messages/" .. messageId
	end	

	self:_request(requestUrl, "DELETE")
end

return Webhook