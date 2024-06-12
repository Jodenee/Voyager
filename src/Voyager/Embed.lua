local Embed = {}
Embed.__index = Embed

function Embed.new(title : string?, description : string?, url : string?)
	local self = setmetatable({}, Embed)

	self.Title = title
	self.Description = description
	self.Url = url

	self.Fields = {}

	return self
end

function Embed:_Validate() : (boolean, string?)
	if self.Title then
		if string.len(self.Title) > 256 then return false, "The title of an embed must only contain up to 256 characters." end
	end

	if self.Description then
		if string.len(self.Description) > 4096 then return false, "The description of an embed must only contain up to 4096 characters." end
	end

	if self.Footer then 
		if string.len(self.Footer.text) > 2048 then return false, "The text in a footer must only contain up to 2048 characters." end

		if self.Footer.icon_url then
			if not self.Footer.icon_url:match("https") then return false, "The footer's icon url only supports HTTP(S)." end
		end
	end

	if self.Image then
		if not self.Image.url:match("https") then return false, "The image's url only supports HTTP(S)." end
	end

	if self.Thumbnail then
		if not self.Thumbnail.url:match("https") then return false, "The thumbnail's url only supports HTTP(S)." end
	end

	if self.Author then 
		if string.len(self.Author.name) > 256 then return false, "The name of an author must only contain up to 256 characters." end

		if self.Author.icon_url then
			if not self.Author.icon_url:match("https") then return false, "The author's icon url only supports HTTP(S)." end
		end
	end

	if #self.Fields > 25 then return false, "One embed must only have up to 25 fields." end

	for _, field in self.Fields do
		if string.len(field.name) > 256 then return false, "The name of a field must only contain up to 256 characters." end
		if string.len(field.value) > 1024 then return false, "The value of a field must only contain up to 1024 characters." end
	end

	return true
end

function Embed:SetTitle(title : string) : nil
	self.Title = title
end

function Embed:SetDescription(description : string) : nil
	self.Description = description
end

function Embed:SetUrl(url : string) : nil
	self.Url = url
end

function Embed:SetTimestamp(customTimestamp : DateTime?) : nil
	if customTimestamp then self.Timestamp = customTimestamp return end

	self.Timestamp = DateTime.now()
end

function Embed:SetColor(color3 : Color3) : nil
	self.Color = color3
end

function Embed:SetFooter(text : string, iconUrl : string?) : nil
	self.Footer = {
		text = text,
		icon_url = iconUrl
	}
end

function Embed:SetImage(url : string) : nil
	self.Image = {
		url = url
	}
end

function Embed:SetThumbnail(url : string) : nil
	self.thumbnail = {
		url = url
	}
end

function Embed:SetAuthor(name : string, url : string?, iconUrl : string?) : nil
	self.Author = {
		name = name,
		url = url,
		icon_url = iconUrl
	}
end

function Embed:AddField(name : string, value : string, inLine : boolean?) : nil
	table.insert(self.Fields, {
		name = name,
		value = value,
		inline = inLine
	})
end

function Embed:TotalCharacters() : number
	local total = 0

	if self.Title then total += string.len(self.Title) end
	if self.Description then total += string.len(self.Description) end
	if self.Footer then total += string.len(self.Footer.text) end
	if self.Author then total += string.len(self.Author.name) end

	if self.Fields then
		for _, field in self.Fields do
			total += (string.len(field.name) + string.len(field.value))
		end
	end

	return total
end

function Embed:_ToObject() : {}
	local embedObject = {
		title = self.Title,
		description = self.Description,
		url = self.Url
	}

	if self.Color then
		embedObject.color = bit32.lshift((self.Color.R * 255), 16) + bit32.lshift((self.Color.G * 255), 8) + (self.Color.B * 255)
	end

	if self.Timestamp then
		embedObject.timestamp = self.Timestamp:ToIsoDate()
	end

	if self.Footer then
		embedObject.footer = {
			text = self.Footer.text,
			icon_url = self.Footer.icon_url
		}
	end

	if self.Image then 
		embedObject.image = {
			url = self.Image.url
		}
	end

	if self.Thumbnail then 
		embedObject.thumbnail = {
			url = self.Thumbnail.url
		}
	end

	if self.Author then
		embedObject.author = {
			name = self.Author.name,
			url = self.Author.url,
			icon_url = self.Author.icon_url
		}
	end

	if #self.Fields > 0 then
		embedObject.fields = {}

		for _, field in self.Fields do
			table.insert(embedObject.fields, {
				name = field.name,
				value = field.value,
				inline = field.inline
			})
		end
	end

	return embedObject
end

return Embed