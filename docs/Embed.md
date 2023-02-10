# <p align = "center">**Embed**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**Embed.title**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The title of the webhook.</p>
---
<br>

## <p align = "left">**Embed.description**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The description of the webhook.</p>
---
<br>

## <p align = "left">**Embed.url**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The url of the webhook.</p>
---
<br>

## <p align = "left">**Embed.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The timestamp of the webhook.</p>
---
<br>

## <p align = "left">**Embed.footer**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The footer of the webhook.</p>
---
<br>

## <p align = "left">**Embed.image**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The image of the webhook.</p>
---
<br>

## <p align = "left">**Embed.thumbnail**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The thumbnail of the webhook.</p>
---
<br>

## <p align = "left">**Embed.author**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The author of the webhook.</p>
---
<br>

## <p align = "left">**Embed.fields**: {[dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)} | [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">The title of the webhook.</p>
---

<br>
<br>

# <p align = "center">*Methods*</p>

<br>
<br>

## <p align = "left">**Embed.new**(title: [string](https://create.roblox.com/docs/scripting/luau/strings)?, description: [string](https://create.roblox.com/docs/scripting/luau/strings)?, url: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [Embed](/docs/Embed.md)</p>
### <p align = "left">This method returns a new Embed object.</p>

### <p align = "left">Parameters:<p>

- title: The title of the embed.
- description: The description of the embed.
- url: The url of the embed.
---
<br>

## <p align = "left">**Embed:_validate**(): ([boolean](https://create.roblox.com/docs/scripting/luau/booleans), [string](https://create.roblox.com/docs/scripting/luau/strings)?)</p>
### <p align = "left">This method validates the embed to avoid making a pointless request to discord.</p>

*<p align = "left">Note: This method is not meant to be used outside Discohook's internal code.</p>*

---
<br>

## <p align = "left">**Embed:setTitle**(title: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's title.</p>

### <p align = "left">Parameters:<p>

- title: The title of the embed.
---
<br>

## <p align = "left">**Embed:setDescription**(description: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's description.</p>

### <p align = "left">Parameters:<p>

- description: The description of the embed.
---
<br>

## <p align = "left">**Embed:setUrl**(url: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's url.</p>

### <p align = "left">Parameters:<p>

- url: The url of the embed.
---
<br>

## <p align = "left">**Embed:setTimestamp**(customTimestamp: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's timestamp.</p>

*<p align = "left">Note: If customTimestamp is left nil then the current timestamp will be used instead.</p>*

### <p align = "left">Parameters:<p>

- customTimestamp: A custom ISO8601 timestamp for the embed.
---
<br>

## <p align = "left">**Embed:setColor**(color3: [Color3](https://create.roblox.com/docs/reference/engine/datatypes/Color3)): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's color.</p>

### <p align = "left">Parameters:<p>

- color3: A color3 value.
---
<br>

## <p align = "left">**Embed:setFooter**(text: [string](https://create.roblox.com/docs/scripting/luau/strings), iconUrl: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's footer.</p>

### <p align = "left">Parameters:<p>

- text: The footer's text.
- iconUrl: The footer's url.
---
<br>

## <p align = "left">**Embed:setImage**(url: [string](https://create.roblox.com/docs/scripting/luau/strings), height: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, width: [number](https://create.roblox.com/docs/scripting/luau/numbers)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's image.</p>

### <p align = "left">Parameters:<p>

- url: The image's url.
- height: The image's height.
- width: The image's width.
---
<br>

## <p align = "left">**Embed:setThumbnail**(url: [string](https://create.roblox.com/docs/scripting/luau/strings), height: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, width: [number](https://create.roblox.com/docs/scripting/luau/numbers)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's thumbnail.</p>

### <p align = "left">Parameters:<p>

- url: The thumbnail's url.
- height: The thumbnail's height.
- width: The thumbnail's width.
---
<br>

## <p align = "left">**Embed:setAuthor**(name: [string](https://create.roblox.com/docs/scripting/luau/strings), url: [string](https://create.roblox.com/docs/scripting/luau/strings)?, iconUrl: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method sets the embed's author.</p>

### <p align = "left">Parameters:<p>

- name: The author's name.
- url: The author's url.
- iconUrl: The icon's url.
---
<br>

## <p align = "left">**Embed:addField**(name: [string](https://create.roblox.com/docs/scripting/luau/strings), value: [string](https://create.roblox.com/docs/scripting/luau/strings), inLine: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)?): [nil](https://create.roblox.com/docs/scripting/luau/nil)</p>
### <p align = "left">This method adds a field to the the embed.</p>

### <p align = "left">Parameters:<p>

- name: The field's name.
- value: The field's value.
- inLine: Whether the field should display inline.
---
<br>

## <p align = "left">**Embed:toDictionary**(): {[string](https://create.roblox.com/docs/scripting/luau/strings): [string](https://create.roblox.com/docs/scripting/luau/strings) | [number](https://create.roblox.com/docs/scripting/luau/numbers) | [nil](https://create.roblox.com/docs/scripting/luau/nil) | {[string](https://create.roblox.com/docs/scripting/luau/strings): [string](https://create.roblox.com/docs/scripting/luau/strings) | [number](https://create.roblox.com/docs/scripting/luau/numbers) | [boolean](https://create.roblox.com/docs/scripting/luau/booleans)}}</p>
### <p align = "left">This method returns the embed in dictionary form.</p>

---
<br>

## <p align = "left">**Embed:totalCharacters**(): [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">This method returns the total amount of characters in the embed.</p>

---
<br>

## <p align = "left">**Embed:colorToRGB**(): {[string](https://create.roblox.com/docs/scripting/luau/strings): [number](https://create.roblox.com/docs/scripting/luau/numbers)}</p>
### <p align = "left">This method returns a dictionary representing the color.</p>

---
<br>