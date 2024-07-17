local User = {}
User.__index = User

local MentionFormatter = require(script.Parent.Utilities.Formatters.MentionFormatter)
local PublicUserFlags = require(script.Parent.PublicUserFlags)

function User.new(data)
	local self = setmetatable({}, User)

	self.Id = data.id
	self.Username = data.username
	self.AvatarHash = data.avatar
	self.IsBot = data.bot or false
	self.Mention = MentionFormatter.MentionUser(data.id)
	self.GlobalName = data.global_name
	self.PublicFlags = PublicUserFlags.fromBitfield(data.public_flags)

	return self
end

function User:GetAvatarUrl(size : number?, imageFormat : (".jpeg" | ".png" | ".webp" | ".gif")?) : string?
	if not self.AvatarHash then return end

	if imageFormat then
		if imageFormat ~= ".jpeg" and imageFormat ~= ".png" and imageFormat ~= ".webp" and imageFormat ~= ".gif" then
			return error("Unsupported image format given.")
		end
	end

	if size then
		if size < 16 or size > 4096 then return error("Image size must be between 16 and 4096.") end
		if math.sqrt(size) % 1 ~= 0 then return error("Image size must be any number to power of two.") end

		return "https://cdn.discordapp.com/avatars/" .. self.Id .. "/" .. self.AvatarHash .. (imageFormat or ".png") .. "?size=" .. size
	else
		return "https://cdn.discordapp.com/avatars/" .. self.Id .. "/" .. self.AvatarHash .. (imageFormat or ".png")
	end
end

function User:HasAnimatedAvatar() : boolean
	if not self.AvatarHash then return false end

	return self.AvatarHash:match("a_") == "a_"
end

return User