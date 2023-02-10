# <p align = "center">**Author**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**Author.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the author.</p>
---
<br>

## <p align = "left">**Author.username**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's username.</p>
---
<br>

## <p align = "left">**Author.avatar**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's avatar hash.</p>
---
<br>

## <p align = "left">**Author.discriminator**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's discriminator.</p>
---
<br>

## <p align = "left">**Author.bot**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the user is a bot.</p>
---
<br>
<br>

# <p align = "center">*Methods*</p>
<br>
<br>

## <p align = "left">**Author.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [Author](docs/Author.md)</p>
### <p align = "left">This method returns a new Author object.</p>

*<p align = "left">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### <p align = "left">Parameters:<p>

- data: Author data
---
<br>

## <p align = "left">**Author:getAvatarUrl**(size: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, imageFormat: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">This method will return the author's avatar url.</p>

*<p align = "left">Note: The size parameter can only be a power of two between 16 and 4096.</p>*

### <p align = "left">Parameters:<p>

- size: The size of the avatar.
- imageFormat: The format the avatar should be in. If left nil the defualt format is .png.
---
<br>

## <p align = "left">**Author:hasAnimatedAvatar**(): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">This method checks Whether the author has an animated avatar.</p>

---