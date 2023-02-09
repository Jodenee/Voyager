local Author = require(script.Parent.Author)
local User = {}
User.__index = User
setmetatable(User, Author)

function User.new(data)
	local self = setmetatable(Author.new(data), User)
	
	self.displayName = data["display_name"]
	self.publicFlags = data["public_flags"]
	
	return self
end

function User:hasFlag(flagNumber: number): boolean
	return bit32.band(self.publicFlags, flagNumber) == flagNumber
end

function User:getFlags(): {string}
	local flags = {}
	
	if bit32.band(self.publicFlags, 1) == 1 then table.insert(flags, 1) end
	if bit32.band(self.publicFlags, 2) == 2 then table.insert(flags, 2) end
	if bit32.band(self.publicFlags, 4) == 4 then table.insert(flags, 4) end
	if bit32.band(self.publicFlags, 8) == 8 then table.insert(flags, 8) end
	if bit32.band(self.publicFlags, 64) == 64 then table.insert(flags, 64) end
	if bit32.band(self.publicFlags, 128) == 128 then table.insert(flags, 128) end
	if bit32.band(self.publicFlags, 256) == 256 then table.insert(flags, 256) end
	if bit32.band(self.publicFlags, 512) == 512 then table.insert(flags, 512) end
	if bit32.band(self.publicFlags, 1024) == 1024 then table.insert(flags, 1024) end
	if bit32.band(self.publicFlags, 16384) == 16384 then table.insert(flags, 16384) end
	if bit32.band(self.publicFlags, 65536) == 65536 then table.insert(flags, 65536) end
	if bit32.band(self.publicFlags, 131072) == 131072 then table.insert(flags, 131072) end
	if bit32.band(self.publicFlags, 262144) == 262144 then table.insert(flags, 262144) end
	if bit32.band(self.publicFlags, 524288) == 524288 then table.insert(flags, 524288) end
	if bit32.band(self.publicFlags, 4194304) == 4194304 then return table.insert(flags, 4194304) end
	
	return flags
end

return User