local EmbedImage = {}
EmbedImage.__index = EmbedImage

function EmbedImage.new(url : string)
	local self = setmetatable({}, EmbedImage)

	self.Url = url

	return self
end

function EmbedImage._FromObject(embedImageObject : {})
	local self = setmetatable({}, EmbedImage)

	self.Url = embedImageObject.url
	self.Width = embedImageObject.width
	self.Height = embedImageObject.height
	self.ProxiedUrl = embedImageObject.proxy_url

	return self
end

function EmbedImage:_ToObject() : {}
    return {
		url = self.Url
	}
end

function EmbedImage:_Validate() : (boolean, string?)
	if not self.Url:lower():match("https://") then
		return false, "The image's url needs to use the HTTPS protocol."
	end

	return true
end

return EmbedImage