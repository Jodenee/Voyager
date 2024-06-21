local OptionalSendMessageInfo = {}
OptionalSendMessageInfo.__index = OptionalSendMessageInfo

local MessageFlags = require(script.Parent.MessageFlags)

function OptionalSendMessageInfo.new(useTTS : boolean?, usernameOverride : string?, avatarOverride : string?, messageFlags : {}?, threadName : string?)
	local self = setmetatable({}, OptionalSendMessageInfo)

	self.UseTTS = useTTS or false
	self.UsernameOverride = usernameOverride
	self.AvatarOverride = avatarOverride
	self.MessageFlags = messageFlags or MessageFlags.FromBitfield(0)
	self.ThreadName = threadName

	return self
end

return OptionalSendMessageInfo