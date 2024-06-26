local Message = {}
Message.__index = Message

local User = require(script.Parent.User)
local Embed = require(script.Parent.Embed)
local MessageFlags = require(script.Parent.MessageFlags)
local EmbedFooter = require(script.Parent.EmbedFooter)
local EmbedImage = require(script.Parent.EmbedImage)
local EmbedThumbnail = require(script.Parent.EmbedThumbnail)
local EmbedAuthor = require(script.Parent.EmbedAuthor)
local EmbedField = require(script.Parent.EmbedField)

function Message.new(data)
	local self = setmetatable({}, Message)

	self.Id = data.id
	self.MessageType = data["type"]
	self.Content = data.content
	self.ChannelId = data.channel_id
	self.Author = User.new(data.author)
	self.Embeds = {}
	self.MentionedUsers = {}
	self.MentionedRoles = {}
	self.IsPinned = data.pinned
	self.MentionsEveryone = data.mention_everyone
	self.IsTTS = data.tts
	self.CreatedAt = DateTime.fromIsoDate(data.timestamp)
	self.Flags = MessageFlags.FromBitfield(data.flags)
	self.WebhookId = data.webhook_id
	self.Position = data.position
	self.JumpUrl = "https://discord.com/channels/@me/" .. self.ChannelId .. "/" .. self.Id

	if data.edited_timestamp then
		self.EditedAt = DateTime.fromIsoDate(data.edited_timestamp)
	end

	if data.embeds then
		for _, embedObject in data.embeds do
			local embed = Embed.new(embedObject.title, embedObject.description, embedObject.url)

			if embedObject.color then
				local red = bit32.band(bit32.rshift(embedObject.color, 16), 255)
				local green = bit32.band(bit32.rshift(embedObject.color, 8), 255)
				local blue = bit32.band(embedObject.color, 255)

				embed:SetColor(Color3.fromRGB(red, green, blue))
			end

			if embedObject.timestamp then
				embed:SetTimestamp(embedObject.timestamp)
			end

			if embedObject.footer then
				embed.Footer = EmbedFooter._FromObject(embedObject.footer)
			end

			if embedObject.image then
				embed.Image = EmbedImage._FromObject(embedObject.image)
			end

			if embedObject.thumbnail then
				embed.Thumbnail = EmbedThumbnail._FromObject(embedObject.thumbnail)
			end

			if embedObject.author then
				embed.Author = EmbedAuthor._FromObject(embedObject.author)
			end

			if embedObject.fields then
				for _, fieldObject in embedObject.fields do
					table.insert(embed.Fields, EmbedField._FromObject(fieldObject))
				end
			end

			table.insert(self.Embeds, embed)
		end
	end

	if data.mentions then
		for _, mentionData in data.mentions do
			table.insert(self.MentionedUsers, User.new(mentionData))
		end
	end

	if data.mention_roles then
		for _, roleId in data.mention_roles do
			table.insert(self.MentionedRoles, roleId)
		end
	end

	return self
end

return Message