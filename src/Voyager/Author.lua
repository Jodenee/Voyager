local Author = {}
Author.__index = Author

function Author.new(data)
	local self = setmetatable({}, Author)
	
	self.id = data.id
	self.username = data.username
	self.avatar = data.avatar
	self.bot = data.bot or false
	
	return self
end

function Author:getAvatarUrl(size : number?, imageFormat : string?) : string?
	if not self.avatar then return end
	if imageFormat then 
		if imageFormat ~= ".jpeg" and imageFormat ~= ".png" and imageFormat ~= ".webp" and imageFormat ~= ".gif" then return error("Unsupported image format given.") end 
	end
	
	if size then
		if size < 16 or size > 4096 then return error("Image size must be between 16 to 4096.") end
		if math.sqrt(size) % 1 ~= 0 then return error("Image size must be any power of two") end
		
		return "https://cdn.discordapp.com/avatars/" .. self.id .. "/" .. self.avatar .. (imageFormat or ".png") .. "?size=" .. size
	else
		return "https://cdn.discordapp.com/avatars/" .. self.id .. "/" .. self.avatar .. (imageFormat or ".png")
	end
end

function Author:hasAnimatedAvatar() : boolean
	if not self.avatar then return false end
	
	return self.avatar:match("a_") == "a_"
end

return Author