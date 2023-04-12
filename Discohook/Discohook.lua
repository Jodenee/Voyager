local Message = require(script.Message)
local EditedMessage = require(script.EditedMessage)
local ThreadMessage = require(script.ThreadMessage)
local EditedThreadMessage = require(script.EditedThreadMessage)
local OptionalExecuteInfo = require(script.OptionalExecuteInfo)
local Webhook = {}
Webhook.__index = Webhook

Webhook.Enum = {
	["UserPublicFlags"] = {
		["STAFF"] = 1,
		["PARTNER"] = 2,
		["HYPESQUAD"] = 4,
		["BUG_HUNTER_LEVEL_1"] = 8,
		["HYPESQUAD_ONLINE_HOUSE_1"] = 64,
		["HYPESQUAD_ONLINE_HOUSE_2"] = 128,
		["HYPESQUAD_ONLINE_HOUSE_3"] = 256,
		["PREMIUM_EARLY_SUPPORTER"] = 512,
		["TEAM_PSEUDO_USER"] = 1024,
		["BUG_HUNTER_LEVEL_2"] = 16384,
		["VERIFIED_BOT"] = 65536,
		["VERIFIED_DEVELOPER"] = 131072,
		["CERTIFIED_MODERATOR"] = 262144,
		["BOT_HTTP_INTERACTIONS"] = 524288,
		["ACTIVE_DEVELOPER"] = 4194304		
	},
	
	["MessageFlags"] = {
		["SUPPRESS_EMBEDS"] = 4
	},
	
	["AvatarImageFormats"] = {
		["JPEG"] = ".jpeg",
		["PNG"] = ".png",
		["WebP"] = ".webp",
		["GIF"] = ".gif"
	}
}

function Webhook.new(id: string, token: string, customProxyUrl: string?)
	local self = setmetatable({}, Webhook)
	
	self.id = id
	self.token = token
	self.baseUrl = (customProxyUrl or "https://webhook.lewisakura.moe") .. "/api/webhooks/" .. self.id .. "/" .. self.token
	
	return self
end

function Webhook:_validateExecuteRequest(content: string?, embeds: {}?, optionalExecuteInfo): (boolean, string?)
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
			return false, "Webhooks must only have up to 10 embeds." 
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

function Webhook:execute(content: string?, embeds: {}?, queue: boolean, waitForMessage: boolean, optionalExecuteInfo)
	local executeInfo = optionalExecuteInfo or OptionalExecuteInfo.new()
	local isRequestValid, errorMessage = self:_validateExecuteRequest(content, embeds, executeInfo)	
	if not isRequestValid then return error(errorMessage) end

	local httpService = game:GetService("HttpService")
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
			table.insert(requestBody.embeds, embed:toDictionary())
		end
	end
	
	if queue then
		requestUrl = self.baseUrl .. "/queue?wait=" .. tostring(waitForMessage)
	else
		requestUrl = self.baseUrl .. "?wait=" .. tostring(waitForMessage)
	end
	
	if executeInfo.threadId then requestUrl ..= "&thread_id=" .. executeInfo.threadId end
	
	local responce = httpService:RequestAsync({
		Url = requestUrl,
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end
	
	if not queue and waitForMessage then
		if not executeInfo.threadId then 
			return Message.new(httpService:JSONDecode(responce.Body))
		else
			return ThreadMessage.new(httpService:JSONDecode(responce.Body))
		end
	end
	
	return responce
end

function Webhook:editMessage(messageId: string, content: string?, embeds: {}?, threadId: string?)
	local httpService = game:GetService("HttpService")
	local requestUrl
	local requestBody = {
		["content"] = content,
		["embeds"] = {}
	}

	if embeds then	
		for _, embed in embeds do
			local isEmbedValid, errorMessage = embed:_validate()
			if not isEmbedValid then error(errorMessage) end
			
			table.insert(requestBody.embeds, embed:toDictionary())
		end
	end
	
	if threadId then
		requestUrl = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	else
		requestUrl = self.baseUrl .. "/messages/" .. messageId
	end
	
	local responce = httpService:RequestAsync({
		Url = requestUrl,
		Method = "PATCH",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end

	if not threadId then
		return EditedMessage.new(httpService:JSONDecode(responce.Body))
	else
		return EditedThreadMessage.new(httpService:JSONDecode(responce.Body))
	end
end

function Webhook:deleteMessage(messageId: string, threadId: string?)
	local httpService = game:GetService("HttpService")
	local requestUrl
	
	if threadId then
		requestUrl = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. threadId
	else
		requestUrl = self.baseUrl .. "/messages/" .. messageId
	end	
	
	local responce = httpService:RequestAsync({
		Url = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. (threadId or ""),
		Method = "DELETE"
	})

	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end
	
	return responce
end

return Webhook