local Reaction = {}
Reaction.__index = Reaction

local Emoji = require(script.Parent.Emoji)

function Reaction.new(data)
	local self = setmetatable({}, Reaction)

	self.emoji = Emoji.new(data.emoji)
	self.me = data.me
	self.count = data.count

	return self
end

return Reaction