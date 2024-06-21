local PublicUserFlags = {}
PublicUserFlags.__index = PublicUserFlags

local BaseFlags = require(script.Parent.Bases.BaseFlags)

setmetatable(PublicUserFlags, BaseFlags)

function PublicUserFlags.FromBitfield(value : number)
	local self = setmetatable(BaseFlags.FromBitfield(value), PublicUserFlags)

	return self
end

function PublicUserFlags:GetFlags() : { number }
	local enum = require(script.Parent.Enum)
	local foundFlags = {}

	for _, flag in enum.PublicUserFlag do
		if self:HasFlag(flag) then table.insert(foundFlags, flag) end
	end

	return foundFlags
end

return PublicUserFlags