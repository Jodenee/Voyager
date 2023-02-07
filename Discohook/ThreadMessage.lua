local Message = require(script.Parent.Message)
local ThreadMessage = {}
ThreadMessage.__index = ThreadMessage
setmetatable(ThreadMessage, Message)

function ThreadMessage.new(data)
	local self = setmetatable(Message.new(data), ThreadMessage)
	
	self.position = data["position"]
	
	return self
end

return ThreadMessage