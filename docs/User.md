# <p align = "center">**User**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **User.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the author.

<br>
<hr>
<br>

## **User.username**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's username.

<br>
<hr>
<br>

## **User.avatar**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's avatar hash.

<br>
<hr>
<br>

## **User.discriminator**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The author's discriminator.

<br>
<hr>
<br>

## **User.bot**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
whether the user is a bot.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **User.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [User](/docs/User.md)
This method returns a new User object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:

- data: User data.

<br>
<hr>
<br>

## **User:getAvatarUrl**(size: [number](https://create.roblox.com/docs/scripting/luau/numbers)?, imageFormat: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [string](https://create.roblox.com/docs/scripting/luau/strings)
This method will return the user's avatar url.

*Note: The size parameter can only be a power of two between 16 and 4096.*

Parameters:

- size: The size of the avatar.
- imageFormat: The format the avatar should be in. If left nil the defualt format is .png.

<br>
<hr>
<br>

## **User:hasAnimatedAvatar**(): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method checks Whether the user has an animated avatar.

<br>
<hr>
<br>

## **User:hasFlag**(flagNumber: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method checks Whether the user has a specific flag.

Parameters:

- flagNumber: A flag bitfield

<br>
<hr>
<br>

## **User:getFlags**(): {[number](https://create.roblox.com/docs/scripting/luau/numbers)}
This method returns all of the user's flags.

<br>
<hr>
<br>