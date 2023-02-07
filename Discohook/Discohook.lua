local Message = require(script.Message)
local EditedMessage = require(script.EditedMessage)
local ThreadMessage = require(script.ThreadMessage)
local EditedThreadMessage = require(script.EditedThreadMessage)
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
	["AvatarImageFormats"] = {
		["jpeg"] = ".jpeg",
		["png"] = ".png",
		["webp"] = ".webp",
		["gif"] = ".gif",
	}
}

function Webhook.new(id: string, token: string)
	local self = setmetatable({}, Webhook)
	
	self.id = id
	self.token = token
	self.baseUrl = "https://webhook.lewisakura.moe/api/webhooks/" .. self.id .. "/" .. self.token
	
	return self
end

function Webhook:_validateExecuteRequest(content: string?, embeds: {}?, usernameOverride: string?): (boolean, string?)
	if (content == nil or content == "") and (embeds == nil or #embeds == 0) then return false, "one of content, embeds are required." end
	if content ~= nil then if string.len(content) > 2000 then return false, "The content must only contain up to 2000 characters." end end
	if embeds ~= nil then if #embeds > 10 then return false, "Webhooks must only have up to 10 embeds." end end
	if usernameOverride ~= nil then if string.len(usernameOverride) < 1 or string.len(usernameOverride) > 80 then return false, "usernameOverride must be between 1 and 80 in length." end end
	if embeds ~= nil then
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

function Webhook:execute(content: string?, embeds: {}?, queue: boolean, waitForMessage: boolean, optionalExecuteInfo: {}?)
	local optionalExecuteInfo = optionalExecuteInfo or require(script.OptionalExecuteInfo).new("", false)
	local isRequestValid, errorMessage = self:_validateExecuteRequest(content, embeds, optionalExecuteInfo.usernameOverride)	
	if not isRequestValid then return error(errorMessage) end
	
	local httpService = game:GetService("HttpService")
	local requestBody = {
		["content"] = content,
		["username"] = optionalExecuteInfo.usernameOverride,
		["avatar_url"] = optionalExecuteInfo.avatarOverride,
		["tts"] = optionalExecuteInfo.tts,
		["embeds"] = {}
	}
	
	if embeds ~= nil then	
		for _, embed in embeds do
			table.insert(requestBody.embeds, embed:toDictionary())
		end
	end
	
	local responce = httpService:RequestAsync({
		Url = if queue then self.baseUrl .. "/queue?wait=" .. tostring(waitForMessage) .. "&thread_id=" .. optionalExecuteInfo.threadId else self.baseUrl .. "?wait=" .. tostring(waitForMessage) .. "&thread_id=" .. optionalExecuteInfo.threadId,
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end

	if not queue and waitForMessage then
		if optionalExecuteInfo ~= nil then 
			if optionalExecuteInfo.threadId == nil then return Message.new(httpService:JSONDecode(responce.Body)) end
			return ThreadMessage.new(httpService:JSONDecode(responce.Body))
		else
			return Message.new(httpService:JSONDecode(responce.Body))
		end
	end
	
	return responce
end

function Webhook:editMessage(messageId: string, content: string?, embeds: {}?, threadId: string?)
	local httpService = game:GetService("HttpService")
	local requestBody = {
		["content"] = content,
		["embeds"] = {}
	}

	if embeds ~= nil then	
		for _, embed in embeds do
			table.insert(requestBody.embeds, embed:toDictionary())
		end
	end
	
	local responce = httpService:RequestAsync({
		Url = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. (threadId or ""),
		Method = "PATCH",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end

	if threadId == nil then
		return EditedMessage.new(httpService:JSONDecode(responce.Body))
	else
		return EditedThreadMessage.new(httpService:JSONDecode(responce.Body))
	end
end

function Webhook:deleteMessage(messageId: string, threadId: string?)
	local httpService = game:GetService("HttpService")
	local responce = httpService:RequestAsync({
		Url = self.baseUrl .. "/messages/" .. messageId .. "?thread_id=" .. (threadId or ""),
		Method = "DELETE"
	})

	if not responce.Success then return error("Status: " .. responce.StatusCode .. " " .. responce.StatusMessage) end
	
	return responce
end

return Webhook