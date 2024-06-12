local OptionalExecuteInfo = {}
OptionalExecuteInfo.__index = OptionalExecuteInfo

local MessageFlags = require(script.Parent.MessageFlags)

function OptionalExecuteInfo.new(threadId : string?, tts : boolean?, usernameOverride : string?, avatarOverride : string?, messageFlags : {}?, threadName : string?)
	local self = setmetatable({}, OptionalExecuteInfo)

	self.ThreadId = threadId
	self.TTS = tts or false
	self.UsernameOverride = usernameOverride
	self.AvatarOverride = avatarOverride
	self.MessageFlags = messageFlags or MessageFlags.FromBitfield(0)
	self.ThreadName = threadName

	return self
end

return OptionalExecuteInfo