local Message = {}
Message.__index = Message

local Author = require(script.Parent.Author)
local User = require(script.Parent.User)
local Embed = require(script.Parent.Embed)
local Reaction = require(script.Parent.Reaction)
local MessageFlags = require(script.Parent.MessageFlags)

function Message.new(data)
	local self = setmetatable({}, Message)

	self.id = data.id
	self.messageType = data["type"]
	self.content = data.content
	self.channelId = data.channel_id
	self.author = Author.new(data.author)
	self.embeds = {}
	self.reactions = {}
	self.mentions = {}
	self.mentionRoles = {}
	self.pinned = data.pinned
	self.mentionEveryone = data.mention_everyone
	self.tts = data.tts
	self.timestamp = data.timestamp
	self.createdAt = DateTime.fromIsoDate(data.timestamp)
	self.flags = MessageFlags.fromBitfield(data.flags)
	self.webhookId = data.webhook_id
	self.jumpUrl = "https://discord.com/channels/@me/" .. self.channelId .. "/" .. self.id

	if data.embeds then
		for _, embedData in data.embeds do
			local embed = Embed.new(embedData.title, embedData.description, embedData.url)

			if embedData.color then
				embed.color = embedData.color
			end

			if embedData.timestamp then
				embed:setTimestamp(embedData.timestamp)
			end

			if embedData.footer then
				embed:setFooter(embedData.footer.text, embedData.footer.icon_url) 

				embed.footer.proxy_icon_url = embedData.footer.proxy_icon_url
			end

			if embedData.image then 
				embed:setImage(embedData.image.url)

				embed.image.height = embedData.image.height
				embed.image.width = embedData.image.width
				embed.image.proxy_url = embedData.image.proxy_url
			end

			if embedData.thumbnail then
				embed:setThumbnail(embedData.thumbnail.url)

				embed.thumbnail.height = embedData.thumbnail.height
				embed.thumbnail.width = embedData.thumbnail.width
				embed.thumbnail.proxy_url = embedData.thumbnail.proxy_url
			end

			if embedData.author then 
				embed:setAuthor(embedData.author.name, embedData.author.url, embedData.author.icon_url)

				embed.author.proxy_icon_url = embedData.author.proxy_icon_url
			end	

			if embedData.fields then
				for _, fieldData in embedData.fields do
					embed:addField(fieldData.name, fieldData.value, fieldData.inline)
				end
			end

			table.insert(self.embeds, embed)
		end
	end	

	if data.mentions then
		for _, mentionData in data.mentions do
			table.insert(self.mentions, User.new(mentionData))
		end
	end	

	if data.mention_roles then
		for _, roleId in data.mention_roles do
			table.insert(self.mentionRoles, roleId)
		end
	end	

	if data.reactions then
		for _, reactionData in data.reactions do
			table.insert(self.reactions, Reaction.new(reactionData))
		end
	end

	return self
end

return Message