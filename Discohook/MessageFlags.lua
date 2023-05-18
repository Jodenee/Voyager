local BaseFlags = require(script.Parent.bases.BaseFlags)
local MessageFlags = {}
MessageFlags.__index = MessageFlags
setmetatable(MessageFlags, BaseFlags)

function MessageFlags.fromFlags(flags: {number})
	local self = setmetatable(BaseFlags.fromBitfield(0), MessageFlags)
	
	for _, flag in flags do
		self.value = bit32.bor(self.value, flag)
	end

	return self
end

return MessageFlags