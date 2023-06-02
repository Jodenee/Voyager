local BaseFlags = {}
BaseFlags.__index = BaseFlags

function BaseFlags.fromBitfield(value : number)
	local self = setmetatable({}, BaseFlags)
	
	self.value = value
	
	return self
end

function BaseFlags:hasFlag(flag : number) : boolean
	return bit32.band(self.value, flag) == flag
end

function BaseFlags:setFlag(flag : number, toggle : boolean) : nil
	if toggle then
		self.value = bit32.bor(self.value, flag)
	else
		self.value = bit32.band(self.value, bit32.bnot(flag))
	end
end

return BaseFlags