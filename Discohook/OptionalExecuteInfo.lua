local MessageFlags = require(script.Parent.MessageFlags)
local OptionalExecuteInfo = {}
OptionalExecuteInfo.__index = OptionalExecuteInfo

function OptionalExecuteInfo.new(threadId: string?, tts: boolean?, usernameOverride: string?, avatarOverride: string?, messageFlags, threadName: string?)
	local self = setmetatable({}, OptionalExecuteInfo)
	
	self.threadId = threadId
	self.tts = tts or false
	self.usernameOverride = usernameOverride
	self.avatarOverride = avatarOverride
	self.messageFlags = messageFlags or MessageFlags.fromBitfield(0)
	self.threadName = threadName
	
	return self
end

return OptionalExecuteInfo