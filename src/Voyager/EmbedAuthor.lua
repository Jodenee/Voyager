local EmbedAuthor = {}
EmbedAuthor.__index = EmbedAuthor

function EmbedAuthor.new(name : string, url : string?, iconUrl : string?)
	local self = setmetatable({}, EmbedAuthor)

    self.Name = name
    self.Url = url
    self.IconUrl = iconUrl

	return self
end

function EmbedAuthor._FromObject(embedAuthorObject : {})
	local self = setmetatable({}, EmbedAuthor)

    self.Name = embedAuthorObject.name
    self.Url = embedAuthorObject.url
    self.IconUrl = embedAuthorObject.icon_url
    self.ProxyIconUrl = embedAuthorObject.proxy_icon_url

	return self
end

function EmbedAuthor:_ToObject() : {}
    return {
        name = self.Name,
        url = self.Url,
        icon_url = self.IconUrl
    }
end

function EmbedAuthor:_Validate() : (boolean, string?)
    if string.len(self.Name) > 256 then
        return false, "The name of an author can only have up to 256 characters."
    end

    if self.Url then
        if not self.Url:match("http://") and not self.Url:match("https://") then
            return false, "The author's url needs to be a valid url."
        end
    end

    if self.IconUrl then
        if not self.IconUrl:match("https://") then
            return false, "The author's icon url needs to use the HTTPS protocol."
        end
    end

    return true
end

return EmbedAuthor