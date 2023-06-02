local OptionalExecuteInfo = {}
OptionalExecuteInfo.__index = OptionalExecuteInfo

local MessageFlags = require(script.Parent.MessageFlags)

function OptionalExecuteInfo.new(threadId : string?, tts : boolean?, usernameOverride : string?, avatarOverride : string?, messageFlags : MessageFlags?, threadName : string?)
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