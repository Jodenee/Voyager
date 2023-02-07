local Emoji = {}
Emoji.__index = Emoji

function Emoji.new(data)
	local self = setmetatable({}, Emoji)
	
	self.id = data["id"]
	self.name = data["name"]
	self.animated = data["animated"]
	
	return self
end

return Emoji