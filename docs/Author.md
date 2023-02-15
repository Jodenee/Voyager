# <p align = "center">**Author**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## Author.id: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the author.

<br>
<hr>
<br>

## **Author.username**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's username.

<br>
<hr>
<br>

## **Author.avatar**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's avatar hash.

<br>
<hr>
<br>

## **Author.discriminator**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's discriminator.

<br>
<hr>
<br>

## **Author.bot**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the user is a bot.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **Author.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [Author](docs/Author.md)
This method returns a new Author object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:

- data: Author data

<br>
<hr>
<br>

## **Author:getAvatarUrl**(size: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, imageFormat: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [string](https://create.roblox.com/docs/scripting/luau/strings)
This method will return the author's avatar url.

*Note: The size parameter can only be a power of two between 16 and 4096.*

Parameters:

- size: The size of the avatar.
- imageFormat: The format the avatar should be in. If left nil the defualt format is .png.

<br>
<hr>
<br>

## **Author:hasAnimatedAvatar**(): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method checks whether the author has an animated avatar.

<br>
<hr>
<br>