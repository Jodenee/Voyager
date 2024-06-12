local Message = {}
Message.__index = Message

local Author = require(script.Parent.Author)
local User = require(script.Parent.User)
local Embed = require(script.Parent.Embed)
local MessageFlags = require(script.Parent.MessageFlags)

function Message.new(data)
	local self = setmetatable({}, Message)

	self.Id = data.id
	self.MessageType = data["type"]
	self.Content = data.content
	self.ChannelId = data.channel_id
	self.Author = Author.new(data.author)
	self.Embeds = {}
	self.MentionedUsers = {}
	self.MentionedRoles = {}
	self.IsPinned = data.pinned
	self.MentionsEveryone = data.mention_everyone
	self.TTS = data.tts
	self.CreatedAt = DateTime.fromIsoDate(data.timestamp)
	self.Flags = MessageFlags.FromBitfield(data.flags)
	self.WebhookId = data.webhook_id
	self.JumpUrl = "https://discord.com/channels/@me/" .. self.ChannelId .. "/" .. self.Id

	if data.embeds then
		for _, embedData in data.embeds do
			local embed = Embed.new(embedData.title, embedData.description, embedData.url)

			if embedData.color then
				local red = bit32.band(bit32.rshift(embedData.color, 16), 255)
				local green = bit32.band(bit32.rshift(embedData.color, 8), 255)
				local blue = bit32.band(embedData.color, 255)

				embed:SetColor(Color3.fromRGB(red, green, blue))
			end

			if embedData.timestamp then
				embed:SetTimestamp(embedData.timestamp)
			end

			if embedData.footer then
				embed:SetFooter(embedData.footer.text, embedData.footer.icon_url) 

				embed.Footer.proxy_icon_url = embedData.footer.proxy_icon_url
			end

			if embedData.image then 
				embed:SetImage(embedData.image.url)

				embed.Image.height = embedData.image.height
				embed.Image.width = embedData.image.width
				embed.Image.proxy_url = embedData.image.proxy_url
			end

			if embedData.thumbnail then
				embed:SetThumbnail(embedData.thumbnail.url)

				embed.Thumbnail.height = embedData.thumbnail.height
				embed.Thumbnail.width = embedData.thumbnail.width
				embed.Thumbnail.proxy_url = embedData.thumbnail.proxy_url
			end

			if embedData.author then
				embed:SetAuthor(embedData.author.name, embedData.author.url, embedData.author.icon_url)

				embed.Author.proxy_icon_url = embedData.author.proxy_icon_url
			end

			if embedData.fields then
				for _, fieldData in embedData.fields do
					embed:AddField(fieldData.name, fieldData.value, fieldData.inline)
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