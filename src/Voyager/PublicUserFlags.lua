local PublicUserFlags = {}
PublicUserFlags.__index = PublicUserFlags

local BaseFlags = require(script.Parent.bases.BaseFlags)

setmetatable(PublicUserFlags, BaseFlags)

function PublicUserFlags.fromBitfield(value : number)
	local self = setmetatable(BaseFlags.fromBitfield(value), PublicUserFlags)

	return self
end

function PublicUserFlags:getFlags() : {number}
	local enum = require(script.Parent.utilities.Enum)
	local foundFlags = {}
	
	for _, flag in enum.UserPublicFlags do
		if self:hasFlag(flag) then table.insert(foundFlags, flag) end
	end
	
	return foundFlags
end

return PublicUserFlags