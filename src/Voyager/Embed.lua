local Embed = {}
Embed.__index = Embed

function Embed.new(title : string?, description : string?, url : string?)
	local self = setmetatable({}, Embed)
	
	self.title = title
	self.description = description
	self.url = url
	
	self.fields = {}
	
	return self
end

function Embed:_validate() : (boolean, string?)
	if self.title then
		if string.len(self.title) > 256 then return false, "The title of an embed must only contain up to 256 characters." end 
	end
	
	if self.description then
		if string.len(self.description) > 4096 then return false, "The description of an embed must only contain up to 4096 characters." end 
	end
	
	if self.footer then 
		if string.len(self.footer.text) > 2048 then return false, "The text in a footer must only contain up to 2048 characters." end 
		
		if self.footer.icon_url then
			if not self.footer.icon_url:match("https") then return false, "The footer's icon url only supports HTTP(S)." end
		end
	end
	
	if self.image then
		if not self.image.url:match("https") then return false, "The image's url only supports HTTP(S)." end
	end
	
	if self.thumbnail then
		if not self.thumbnail.url:match("https") then return false, "The thumbnail's url only supports HTTP(S)." end	
	end
	
	if self.author then 
		if string.len(self.author.name) > 256 then return false, "The name of an author must only contain up to 256 characters." end
		
		if self.author.icon_url then
			if not self.author.icon_url:match("https") then return false, "The author's icon url only supports HTTP(S)." end
		end
	end
	
	if #self.fields > 25 then return false, "One embed must only have up to 25 fields." end
	
	for _, field in self.fields do
		if string.len(field.name) > 256 then return false, "The name of a field must only contain up to 256 characters." end
		if string.len(field.value) > 1024 then return false, "The value of a field must only contain up to 1024 characters." end			
	end
	
	return true
end

function Embed:setTitle(title : string) : nil	
	self.title = title
end

function Embed:setDescription(description : string) : nil	
	self.description = description
end

function Embed:setUrl(url : string) : nil
	self.url = url
end

function Embed:setTimestamp(customTimestamp : string?) : nil
	if customTimestamp then self.timestamp = customTimestamp return end

	self.timestamp = os.date("!%Y-%m-%dT%H:%M:%S." .. math.round(tick() % 1 * 1000) .. "Z")
end

function Embed:setColor(color3 : Color3) : nil
	self.color = bit32.lshift((color3.R * 255), 16) + bit32.lshift((color3.G * 255), 8) + (color3.B * 255)
end

function Embed:setFooter(text : string, iconUrl : string?) : nil
	self.footer = {
		text = text,
		icon_url = iconUrl
	}
end

function Embed:setImage(url : string) : nil
	self.image = {
		url = url
	}
end

function Embed:setThumbnail(url : string) : nil
	self.thumbnail = {
		url = url
	}
end

function Embed:setAuthor(name : string, url : string?, iconUrl : string?) : nil
	self.author = {
		name = name,
		url = url,
		icon_url = iconUrl
	}
end

function Embed:addField(name : string, value : string, inLine : boolean?) : nil
	table.insert(self.fields, {
		name = name,
		value = value,
		inline = inLine
	})
end

function Embed:totalCharacters() : number
	local total = 0
	
	if self.title then total += string.len(self.title) end
	if self.description then total += string.len(self.description) end
	if self.footer then total += string.len(self.footer.text) end
	if self.author then total += string.len(self.author.name) end
	
	if self.fields then
		for _, field in self.fields do
			total += (string.len(field.name) + string.len(field.value))
		end
	end
	
	return total
end

function Embed:colorToRGB() : {red : number, green : number, blue : number}?
	if not self.color then return end
	
	local r = bit32.band((bit32.rshift(self.color, (8 * 2))), 0xFF)
	local g = bit32.band((bit32.rshift(self.color, (8 * 1))), 0xFF)
	local b = bit32.band((bit32.rshift(self.color, (8 * 0))), 0xFF)
	
	return {
		red = r,
		green = g,
		blue = b
	}
end

return Embed