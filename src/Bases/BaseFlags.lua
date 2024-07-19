local BaseFlags = {}
BaseFlags.__index = BaseFlags

function BaseFlags.fromBitfield(value : number)
	local self = setmetatable({}, BaseFlags)

	self.Value = value

	return self
end

function BaseFlags:HasFlag(flag : number) : boolean
	return bit32.band(self.Value, flag) == flag
end

function BaseFlags:SetFlag(flag : number, toggle : boolean) : nil
	if toggle then
		self.Value = bit32.bor(self.Value, flag)
	else
		self.Value = bit32.band(self.Value, bit32.bnot(flag))
	end
end

return BaseFlags