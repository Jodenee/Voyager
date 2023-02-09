# <p style="text-align: center;">**Author**</p>

<br>

# <p style="text-align: center;">*Properties*</p>

<br>

## <p style="text-align: left;">**Author.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the author.</p>
---
<br>

## <p style="text-align: left;">**Author.username**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The author's username.</p>
---
<br>

## <p style="text-align: left;">**Author.avatar**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The author's avatar hash.</p>
---
<br>

## <p style="text-align: left;">**Author.discriminator**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The author's discriminator.</p>
---
<br>

## <p style="text-align: left;">**Author.bot**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">whether the user is a bot.</p>
---
<br>
<br>

# <p style="text-align: center;">*Methods*</p>
<br>
<br>

## <p style="text-align: left;">**Author.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [Author](docs/Author.md)</p>
### <p style="text-align: left;">This method returns a new Author object.</p>

### Parameters:

- data: Author data
---
<br>

## <p style="text-align: left;">**Author:getAvatarUrl**(size: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, imageFormat: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">This method will return the author's avatar url.</p>

*<p style="text-align: left;">Note: The size parameter can only be a power of two between 16 and 4096.</p>*

### Parameters:

- size: The size of the avatar.
- imageFormat: The format the avatar should be in. If left nil the defualt format is .png.
---
<br>

## <p style="text-align: left;">**Author:hasAnimatedAvatar**(): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">This method checks Whether the author has an animated avatar.</p>

---