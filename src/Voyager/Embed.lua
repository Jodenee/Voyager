local Embed = {}
Embed.__index = Embed

local EmbedFooter = require(script.Parent.EmbedFooter)
local EmbedImage = require(script.Parent.EmbedImage)
local EmbedThumbnail = require(script.Parent.EmbedThumbnail)
local EmbedAuthor = require(script.Parent.EmbedAuthor)
local EmbedField = require(script.Parent.EmbedField)

function Embed.new(
	title : string?,
	description : string?,
	url : string?,
	timestamp : DateTime?,
	color : Color3?,
	footer : {}?,
	image : {}?,
	thumbnail: {}?,
	author: {}?,
	fields: {}?
)
	local self = setmetatable({}, Embed)

	self.Title = title
	self.Description = description
	self.Url = url
	self.Timestamp = timestamp
	self.Color = color
	self.Footer = footer
	self.Image = image
	self.Thumbnail = thumbnail
	self.Author = author
	self.Fields = fields or {}

	return self
end

function Embed:_Validate() : (boolean, string?)
	if self.Title then
		if string.len(self.Title) > 256 then
			return false, "The title of an embed can only have up to 256 characters."
		end
	end

	if self.Description then
		if string.len(self.Description) > 4096 then
			return false, "The description of an embed can only have up to 4096 characters."
		end
	end

	if self.Footer then
		local isFooterValid, errorMessage = self.Footer:_Validate()

		if not isFooterValid then return false, errorMessage end
	end

	if self.Image then
		local isImageValid, errorMessage = self.Image:_Validate()

		if not isImageValid then return false, errorMessage end
	end

	if self.Thumbnail then
		local isThumbnailValid, errorMessage = self.Thumbnail:_Validate()

		if not isThumbnailValid then return false, errorMessage end
	end

	if self.Author then
		local isAuthorValid, errorMessage = self.Author:_Validate()

		if not isAuthorValid then return false, errorMessage end
	end

	if #self.Fields > 25 then
		return false, "One embed can only have up to 25 fields."
	end

	for index, field in self.Fields do
		local isFieldValid, errorMessage = field:_Validate()

		if not isFieldValid then
			return false, "Fields[" .. index .."]: " .. errorMessage
		end
	end

	return true
end

function Embed:SetTitle(title : string) : { }
	self.Title = title

	return self
end

function Embed:SetDescription(description : string) : { }
	self.Description = description

	return self
end

function Embed:SetUrl(url : string) : { }
	self.Url = url

	return self
end

function Embed:SetTimestamp(customTimestamp : DateTime?) : { }
	if customTimestamp then self.Timestamp = customTimestamp return end

	self.Timestamp = DateTime.now()

	return self
end

function Embed:SetColor(color3 : Color3) : { }
	self.Color = color3

	return self
end

function Embed:SetFooter(text : string, iconUrl : string?) : { }
	self.Footer = EmbedFooter.new(text, iconUrl)

	return self
end

function Embed:SetImage(url : string) : { }
	self.Image = EmbedImage.new(url)

	return self
end

function Embed:SetThumbnail(url : string) : { }
	self.thumbnail = EmbedThumbnail.new(url)

	return self
end

function Embed:SetAuthor(name : string, url : string?, iconUrl : string?) : { }
	self.Author = EmbedAuthor.new(name, url, iconUrl)

	return self
end

function Embed:AddField(name : string, value : string, inLine : boolean?) : { }
	table.insert(self.Fields, EmbedField.new(name, value, inLine))

	return self
end

function Embed:SetFieldAt(fieldPosition : number, name : string, value : string, inLine : boolean?)
	if fieldPosition > (#self.Fields + 1) or fieldPosition <= 0  then
		error("Could not set field at index " .. fieldPosition .. ", make sure the fieldPosition is less than or 1 greater than the length of the fields table.")
	end

	table.insert(
		self.Fields,
		fieldPosition,
		EmbedField.new(name, value, inLine)
	)

	return self
end

function Embed:RemoveFieldAt(fieldPosition : number) : { }
	if fieldPosition > #self.Fields or fieldPosition <= 0  then
		error("No field exists at index " .. fieldPosition .. ".")
	end

	table.remove(self.Fields, fieldPosition)

	return self
end

function Embed:TotalCharacters() : number
	local total = 0

	if self.Title then total += string.len(self.Title) end
	if self.Description then total += string.len(self.Description) end
	if self.Footer then total += string.len(self.Footer.Text) end
	if self.Author then total += string.len(self.Author.Name) end

	if self.Fields then
		for _, field in self.Fields do
			total += (string.len(field.Name) + string.len(field.Value))
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
		embedObject.footer = self.Footer:_ToObject()
	end

	if self.Image then
		embedObject.image = self.Image:_ToObject()
	end

	if self.Thumbnail then
		embedObject.thumbnail = self.Thumbnail:_ToObject()
	end

	if self.Author then
		embedObject.author = self.Author:_ToObject()
	end

	if #self.Fields > 0 then
		embedObject.fields = {}

		for _, field in self.Fields do
			table.insert(embedObject.fields, field:_ToObject())
		end
	end

	return embedObject
end

return Embed