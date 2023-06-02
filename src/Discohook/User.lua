local User = {}
User.__index = User

local Author = require(script.Parent.Author)
local PublicUserFlags = require(script.Parent.PublicUserFlags)

setmetatable(User, Author)

function User.new(data)
	local self = setmetatable(Author.new(data), User)
	
	self.displayName = data["display_name"]
	self.publicFlags = PublicUserFlags.fromBitfield(data["public_flags"])
	
	return self
end

return User