local Emoji = {}
Emoji.__index = Emoji

function Emoji.new(data)
	local self = setmetatable({}, Emoji)
	
	self.id = data["id"]
	self.name = data["name"]
	self.animated = if data["animated"] ~= nil then data["animated"] else false
	
	return self
end

return Emoji