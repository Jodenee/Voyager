local EmbedField = {}
EmbedField.__index = EmbedField

function EmbedField.new(name : string, value : string, inLine : boolean?)
	local self = setmetatable({}, EmbedField)

	self.Name = name
	self.Value = value
	self.InLine = inLine

	return self
end

function EmbedField._fromObject(embedFieldObject : {})
	local self = setmetatable({}, EmbedField)

	self.Name = embedFieldObject.name
	self.Value = embedFieldObject.value
	self.InLine = embedFieldObject.inline

	return self
end

function EmbedField:_ToObject() : {}
    return {
		name = self.Name,
		value = self.Value,
		inline = self.InLine
	}
end

function EmbedField:_Validate() : (boolean, string?)
	if string.len(self.Name) > 256 then
		return false, "The name of a field can only have up to 256 characters."
	end

	if string.len(self.Value) > 1024 then
		return false, "The value of a field can only have up to 1024 characters."
	end

	return true
end

return EmbedField