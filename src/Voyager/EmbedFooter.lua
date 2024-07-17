local EmbedFooter = {}
EmbedFooter.__index = EmbedFooter

function EmbedFooter.new(text : string, iconUrl : string?)
	local self = setmetatable({}, EmbedFooter)

	self.Text = text
	self.IconUrl = iconUrl

	return self
end

function EmbedFooter._fromObject(embedFooterObject : {})
	local self = setmetatable({}, EmbedFooter)

	self.Text = embedFooterObject.text
	self.IconUrl = embedFooterObject.icon_url
	self.ProxiedIconUrl = embedFooterObject.proxy_icon_url

	return self
end

function EmbedFooter:_ToObject() : {}
    return {
		text = self.Text,
		icon_url = self.IconUrl
	}
end

function EmbedFooter:_Validate() : (boolean, string?)
	if string.len(self.Text) > 2048 then
		return false, "The text in the footer can only have up to 2048 characters."
	end

	if self.IconUrl then
		if not self.IconUrl:lower():match("https://") then
			return false, "The footer's icon url needs to use the HTTPS protocol."
		end
	end

	return true
end

return EmbedFooter