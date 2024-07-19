local OptionalSendMessageInfo = {}
OptionalSendMessageInfo.__index = OptionalSendMessageInfo

function OptionalSendMessageInfo.new(useTTS : boolean?, usernameOverride : string?, avatarOverride : string?, flags : {}?, threadName : string?)
	local self = setmetatable({}, OptionalSendMessageInfo)

	self.UseTTS = useTTS
	self.UsernameOverride = usernameOverride
	self.AvatarOverride = avatarOverride
	self.Flags = flags
	self.ThreadName = threadName

	return self
end

return OptionalSendMessageInfo