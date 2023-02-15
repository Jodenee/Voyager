# <p align = "center">**Message**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **Message.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the message.

<br>
<hr>
<br>

## **Message.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message.

<br>
<hr>
<br>

## **Message.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The content of the message.

<br>
<hr>
<br>

## **Message.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br>
<hr>
<br>

## **Message.author**: [Author](/docs/Author.md)
The the author of the message.

<br>
<hr>
<br>

## **Message.embeds**: {[Embed](/docs/Embed.md)} | {}
A list of embedded content attached to the message.

<br>
<hr>
<br>

## **Message.reactions**: {[Reaction](/docs/Reaction.md)} | {}
A list of reactions to the message.

<br>
<hr>
<br>

## **Message.mentions**: {[User](/docs/User.md)} | {}
A list of users specifically mentioned in the message.

<br>
<hr>
<br>

## **Message.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}
A list of role ids specifically mentioned in the message.

<br>
<hr>
<br>

## **Message.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br>
<hr>
<br>

## **Message.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions everyone.

<br>
<hr>
<br>

## **Message.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br>
<hr>
<br>

## **Message.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was sent in ISO8601 format.

<br>
<hr>
<br>

## **Message.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The message's flags combined as a bitfield.

<br>
<hr>
<br>

## **Message.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's id.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **Message.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [Message](/docs/Message.md)
This method returns a new Message object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:<p>

- data: message data.

<br>
<hr>
<br>