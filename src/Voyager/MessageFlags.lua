local MessageFlags = {}
MessageFlags.__index = MessageFlags

local BaseFlags = require(script.Parent.Bases.BaseFlags)

setmetatable(MessageFlags, BaseFlags)

function MessageFlags.FromBitfield(value : number)
	local self = setmetatable(BaseFlags.FromBitfield(value), MessageFlags)

	return self
end

function MessageFlags.FromFlags(flags : { number })
	local self = setmetatable(BaseFlags.FromBitfield(0), MessageFlags)

	for _, flag in flags do
		self.Value = bit32.bor(self.Value, flag)
	end

	return self
end

function MessageFlags:GetFlags() : { number }
	local enum = require(script.Parent.Enum)
	local foundFlags = {}

	for _, flag in enum.MessageFlag do
		if self:HasFlag(flag) then table.insert(foundFlags, flag) end
	end

	return foundFlags
end

return MessageFlags