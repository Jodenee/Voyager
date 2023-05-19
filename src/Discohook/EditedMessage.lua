local Message = require(script.Parent.Message)
local EditedMessage = {}
EditedMessage.__index = EditedMessage
setmetatable(EditedMessage, Message)

function EditedMessage.new(data)
	local self = setmetatable(Message.new(data), EditedMessage)
	
	self.editedTimestamp = data["edited_timestamp"]
	
	return self
end

return EditedMessage