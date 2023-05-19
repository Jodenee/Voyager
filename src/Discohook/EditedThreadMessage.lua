local ThreadMessage = require(script.Parent.ThreadMessage)
local EditedThreadMessage = {}
EditedThreadMessage.__index = EditedThreadMessage
setmetatable(EditedThreadMessage, ThreadMessage)

function EditedThreadMessage.new(data)
	local self = setmetatable(ThreadMessage.new(data), EditedThreadMessage)
	
	self.editedTimestamp = data["edited_timestamp"]
	
	return self
end

return EditedThreadMessage