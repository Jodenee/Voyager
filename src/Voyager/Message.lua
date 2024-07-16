local Message = {}
Message.__index = Message

local User = require(script.Parent.User)
local Embed = require(script.Parent.Embed)
local MessageFlags = require(script.Parent.MessageFlags)

function Message.new(data)
	local self = setmetatable({}, Message)

	self.Id = data.id
	self.MessageType = data["type"]
	self.Content = data.content
	self.ChannelId = data.channel_id
	self.Author = User.new(data.author)
	self.Embeds = {}
	self.MentionedUsers = {}
	self.MentionedRoles = data.mention_roles
	self.IsPinned = data.pinned
	self.MentionsEveryone = data.mention_everyone
	self.IsTTS = data.tts
	self.CreatedAt = DateTime.fromIsoDate(data.timestamp)
	self.Flags = MessageFlags.fromBitfield(data.flags)
	self.WebhookId = data.webhook_id
	self.Position = data.position
	self.JumpUrl = "https://discord.com/channels/@me/" .. self.ChannelId .. "/" .. self.Id

	if data.edited_timestamp then
		self.EditedAt = DateTime.fromIsoDate(data.edited_timestamp)
	end

	if data.embeds then
		for _, embedObject in data.embeds do
			table.insert(self.Embeds, Embed._fromObject(embedObject))
		end
	end

	if data.mentions then
		for _, mentionData in data.mentions do
			table.insert(self.MentionedUsers, User.new(mentionData))
		end
	end

	return self
end

return Message