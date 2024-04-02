local MessageFlags = {}
MessageFlags.__index = MessageFlags

local BaseFlags = require(script.Parent.bases.BaseFlags)

setmetatable(MessageFlags, BaseFlags)

function MessageFlags.fromBitfield(value : number)
	local self = setmetatable(BaseFlags.fromBitfield(value), MessageFlags)

	return self
end

function MessageFlags.fromFlags(flags : {number})
	local self = setmetatable(BaseFlags.fromBitfield(0), MessageFlags)
	
	for _, flag in flags do
		self.value = bit32.bor(self.value, flag)
	end

	return self
end

function MessageFlags:getFlags() : {number}
	local enum = require(script.Parent.utilities.Enum)
	local foundFlags = {}

	for _, flag in enum.MessageFlags do
		if self:hasFlag(flag) then table.insert(foundFlags, flag) end
	end

	return foundFlags
end

return MessageFlags