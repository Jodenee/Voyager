local Author = {}
Author.__index = Author

function Author.new(data)
	local self = setmetatable({}, Author)

	self.Id = data.id
	self.Username = data.username
	self.Avatar = data.avatar
	self.Bot = data.bot or false
	self.Mention = "<@" .. data.id .. ">"

	return self
end

function Author:GetAvatarUrl(size : number?, imageFormat : (".jpeg" | ".png" | ".webp" | ".gif")?) : string?
	if not self.Avatar then return end

	if imageFormat then 
		if imageFormat ~= ".jpeg" and imageFormat ~= ".png" and imageFormat ~= ".webp" and imageFormat ~= ".gif" then
			return error("Unsupported image format given.") 
		end
	end

	if size then
		if size < 16 or size > 4096 then return error("Image size must be between 16 to 4096.") end
		if math.sqrt(size) % 1 ~= 0 then return error("Image size must be any power of two") end

		return "https://cdn.discordapp.com/avatars/" .. self.Id .. "/" .. self.Avatar .. (imageFormat or ".png") .. "?size=" .. size
	else
		return "https://cdn.discordapp.com/avatars/" .. self.Id .. "/" .. self.Avatar .. (imageFormat or ".png")
	end
end

function Author:HasAnimatedAvatar() : boolean
	if not self.Avatar then return false end

	return self.Avatar:match("a_") == "a_"
end

return Author