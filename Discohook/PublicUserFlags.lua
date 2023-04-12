local BaseFlags = require(script.Parent.bases.BaseFlags)
local PublicUserFlags = {}
PublicUserFlags.__index = PublicUserFlags
setmetatable(PublicUserFlags, BaseFlags)

function PublicUserFlags.fromBitfield(value: number)
	local self = setmetatable(BaseFlags.fromBitfield(value), PublicUserFlags)
	
	return self
end

function PublicUserFlags:getFlags(): {number}
	local discohookEnum = require(script.Parent).Enum
	local flags = {}
	
	for _, flag in discohookEnum.UserPublicFlags do
		if self:hasFlag(flag) then table.insert(flags, flag) end
	end
	
	return flags
end

return PublicUserFlags