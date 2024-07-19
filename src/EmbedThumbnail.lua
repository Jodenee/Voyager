local EmbedThumbnail = {}
EmbedThumbnail.__index = EmbedThumbnail

function EmbedThumbnail.new(url : string)
	local self = setmetatable({}, EmbedThumbnail)

	self.Url = url

	return self
end

function EmbedThumbnail._fromObject(embedImageObject : {})
	local self = setmetatable({}, EmbedThumbnail)

	self.Url = embedImageObject.url
	self.Width = embedImageObject.width
	self.Height = embedImageObject.height
	self.ProxiedUrl = embedImageObject.proxy_url

	return self
end

function EmbedThumbnail:_ToObject() : {}
    return {
		url = self.Url
	}
end

function EmbedThumbnail:_Validate() : (boolean, string?)
	if not self.Url:lower():match("https://") then
		return false, "The thumbnail's url needs to use the HTTPS protocol."
	end

	return true
end

return EmbedThumbnail