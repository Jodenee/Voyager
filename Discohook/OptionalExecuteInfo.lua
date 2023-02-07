local OptionalExecuteInfo = {}
OptionalExecuteInfo.__index = OptionalExecuteInfo

function OptionalExecuteInfo.new(threadId: string?, tts: boolean?, usernameOverride: string?, avatarOverride: string?)
	local self = setmetatable({}, OptionalExecuteInfo)
	
	self.threadId = threadId or ""
	self.tts = tts or false
	self.usernameOverride = usernameOverride
	self.avatarOverride = avatarOverride
	
	return self
end

return OptionalExecuteInfo