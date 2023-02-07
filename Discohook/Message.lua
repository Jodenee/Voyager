local Author = require(script.Parent.Author)
local User = require(script.Parent.User)
local Embed = require(script.Parent.Embed)
local Reaction = require(script.Parent.Reaction)
local Message = {}
Message.__index = Message

function Message.new(data)
	local self = setmetatable({}, Message)
	
	self.id = data["id"]
	self.messageType = data["type"]
	self.content = data["content"]
	self.channelId = data["channel_id"]
	self.author = Author.new(data["author"])
	self.embeds = {}
	self.reactions = {}
	self.mentions = {}
	self.mentionRoles = {}
	self.pinned = data["pinned"]
	self.mentionEveryone = data["mentionEveryone"]
	self.tts = data["tts"]
	self.timestamp = data["timestamp"]
	self.flags = data["flags"]
	self.webhookId = data["webhook_id"]
	
	if data["embeds"] ~= nil then
		for _, embedData in data["embeds"] do
			local embed = Embed.new(embedData["title"], embedData["description"], embedData["url"])
			local r = bit32.band((bit32.rshift(embedData["color"], (8 * 2))), 0xFF)
			local g = bit32.band((bit32.rshift(embedData["color"], (8 * 1))), 0xFF)
			local b = bit32.band((bit32.rshift(embedData["color"], (8 * 0))), 0xFF)
			
			embed:setTimestamp(embedData["timestamp"])		
			embed:setColor(Color3.fromRGB(r, g, b))
			if embedData["footer"] ~= nil then embed:setFooter(embedData["footer"]["text"], embedData["footer"]["icon_url"]) end
			if embedData["image"] ~= nil then embed:setImage(embedData["image"]["url"], embedData["image"]["height"], embedData["image"]["width"]) end
			if embedData["thumbnail"] ~= nil then embed:setThumbnail(embedData["thumbnail"]["url"], embedData["thumbnail"]["height"], embedData["thumbnail"]["width"]) end
			if embedData["author"] ~= nil then embed:setAuthor(embedData["author"]["name"], embedData["author"]["url"], embedData["author"]["icon_url"]) end
			
			
			if embedData["fields"] ~= nil then
				for _, field in embedData["fields"] do
					embed:addField(field["name"], field["value"], field["inline"])
				end
			end
		
			table.insert(self.embeds, embed)
		end
	end	
	
	if data["mentions"] ~= nil then
		for _, mentionData in data["mentions"] do
			table.insert(self.mentions, User.new(mentionData))
		end
	end	
	
	if data["mentionRoles"] ~= nil then
		for _, roleMentionData in data["mentionRoles"] do
			table.insert(self.mentionRoles, roleMentionData)
		end
	end	
	
	if data["reactions"] ~= nil then
		for _, reactionData in data["reactions"] do
			table.insert(self.reactions, Reaction.new(reactionData))
		end
	end
	
	return self
end

return Message