# <p align = "center">**ThreadMessage**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **ThreadMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the message.

<br>
<hr>
<br>

## **ThreadMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message.

<br>
<hr>
<br>

## **ThreadMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The content of the message.

<br>
<hr>
<br>

## **ThreadMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br>
<hr>
<br>

## **ThreadMessage.author**: [Author](/docs/Author.md)
The the author of the message.

<br>
<hr>
<br>

## **ThreadMessage.embeds**: {[Embed](/docs/Embed.md)} | {}
A list of embedded content attached to the message.

<br>
<hr>
<br>

## **ThreadMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}
A list of reactions to the message.

<br>
<hr>
<br>

## **ThreadMessage.mentions**: {[User](/docs/User.md)} | {}
A list of users specifically mentioned in the message.

<br>
<hr>
<br>

## **ThreadMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}
A list of role ids specifically mentioned in the message.

<br>
<hr>
<br>

## **ThreadMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br>
<hr>
<br>

## **ThreadMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions everyone.

<br>
<hr>
<br>

## **ThreadMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br>
<hr>
<br>

## **ThreadMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was sent in ISO8601 format.

<br>
<hr>
<br>

## **ThreadMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The message's flags combined as a bitfield.

<br>
<hr>
<br>

## **ThreadMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's id.

<br>
<hr>
<br>

## **ThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
A number that represents the approximate position of the message in a thread.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **ThreadMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [ThreadMessage](/docs/ThreadMessage.md)
This method returns a new ThreadMessage object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:

- data: message data.
---