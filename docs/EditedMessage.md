# <p align = "center">**EditedMessage**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **EditedMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the message.

<br>
<hr>
<br>

## **EditedMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message.

<br>
<hr>
<br>

## **EditedMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The content of the message.

<br>
<hr>
<br>

## **EditedMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br>
<hr>
<br>

## **EditedMessage.author**: [Author](/docs/Author.md)
The the author of the message.

<br>
<hr>
<br>

## **EditedMessage.embeds**: {[Embed](/docs/Embed.md)} | {}
A list of embedded content attached to the message.

<br>
<hr>
<br>

## **EditedMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}
A list of reactions to the message.

<br>
<hr>
<br>

## **EditedMessage.mentions**: {[User](/docs/User.md)} | {}
A list of users specifically mentioned in the message.

<br>
<hr>
<br>

## **EditedMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}
A list of role ids specifically mentioned in the message.

<br>
<hr>
<br>

## **EditedMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br>
<hr>
<br>

## **EditedMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions everyone.

<br>
<hr>
<br>

## **EditedMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br>
<hr>
<br>

## **EditedMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was sent in ISO8601 format.

<br>
<hr>
<br>

## **EditedMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The message's flags combined as a bitfield.

<br>
<hr>
<br>

## **EditedMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's id.

<br>
<hr>
<br>

## **EditedMessage.editedTimestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was edited in ISO8601 format.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **EditedMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [EditedMessage](/docs/EditedMessage.md)
This method returns a new EditedMessage object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:
- data: message data.

<br>
<hr>
<br>