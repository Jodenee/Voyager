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

function User:hasFlag(flagNumber): boolean
	return bit32.band(self.publicFlags, flagNumber) == flagNumber
end

function User:getFlags(): {string}
	local flags = {}
	
	if bit32.band(self.publicFlags, 1) == 1 then table.insert(flags, "STAFF") end
	if bit32.band(self.publicFlags, 2) == 2 then table.insert(flags, "PARTNER") end
	if bit32.band(self.publicFlags, 4) == 4 then table.insert(flags, "HYPESQUAD") end
	if bit32.band(self.publicFlags, 8) == 8 then table.insert(flags, "BUG_HUNTER_LEVEL_1") end
	if bit32.band(self.publicFlags, 64) == 64 then table.insert(flags, "HYPESQUAD_ONLINE_HOUSE_1") end
	if bit32.band(self.publicFlags, 128) == 128 then table.insert(flags, "HYPESQUAD_ONLINE_HOUSE_2") end
	if bit32.band(self.publicFlags, 256) == 256 then table.insert(flags, "HYPESQUAD_ONLINE_HOUSE_3") end
	if bit32.band(self.publicFlags, 512) == 512 then table.insert(flags, "PREMIUM_EARLY_SUPPORTER") end
	if bit32.band(self.publicFlags, 1024) == 1024 then table.insert(flags, "TEAM_PSEUDO_USER") end
	if bit32.band(self.publicFlags, 16384) == 16384 then table.insert(flags, "BUG_HUNTER_LEVEL_2") end
	if bit32.band(self.publicFlags, 65536) == 65536 then table.insert(flags, "VERIFIED_BOT") end
	if bit32.band(self.publicFlags, 131072) == 131072 then table.insert(flags, "VERIFIED_DEVELOPER") end
	if bit32.band(self.publicFlags, 262144) == 262144 then table.insert(flags, "CERTIFIED_MODERATOR") end
	if bit32.band(self.publicFlags, 524288) == 524288 then table.insert(flags, "BOT_HTTP_INTERACTIONS") end
	if bit32.band(self.publicFlags, 4194304) == 4194304 then return table.insert(flags, "ACTIVE_DEVELOPER") end
	
	return flags
end

return User