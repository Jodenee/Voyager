# <p align = "center">**User**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**User.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the author.</p>
---
<br>

## <p align = "left">**User.username**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's username.</p>
---
<br>

## <p align = "left">**User.avatar**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's avatar hash.</p>
---
<br>

## <p align = "left">**User.discriminator**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The author's discriminator.</p>
---
<br>

## <p align = "left">**User.bot**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">whether the user is a bot.</p>
---

<br>
<br>

# <p align = "center">*Methods*</p>
<br>
<br>

## <p align = "left">**User.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [User](/docs/User.md)</p>
### <p align = "left">This method returns a new User object.</p>

*<p align = "left">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### <p align = "left">Parameters:<p>

- data: User data.
---
<br>

## <p align = "left">**User:getAvatarUrl**(size: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, imageFormat: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">This method will return the user's avatar url.</p>

*<p align = "left">Note: The size parameter can only be a power of two between 16 and 4096.</p>*

### <p align = "left">Parameters:<p>

- size: The size of the avatar.
- imageFormat: The format the avatar should be in. If left nil the defualt format is .png.
---
<br>

## <p align = "left">**User:hasAnimatedAvatar**(): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">This method checks Whether the user has an animated avatar.</p>

---
<br>

## <p align = "left">**User:hasFlag**(flagNumber: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">This method checks Whether the user has a specific flag.</p>

### <p align = "left">Parameters:<p>

- flagNumber: A flag bitfield
---
<br>

## <p align = "left">**User:getFlags**(): {[number](https://create.roblox.com/docs/scripting/luau/numbers)}</p>
### <p align = "left">This method returns all of the user's flags.</p>

---