# <p align = "center">**EditedThreadMessage**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **EditedThreadMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the message.

<br>
<hr>
<br>

## **EditedThreadMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message.

<br>
<hr>
<br>

## **EditedThreadMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The content of the message.

<br>
<hr>
<br>

## **EditedThreadMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br>
<hr>
<br>

## **EditedThreadMessage.author**: [Author](/docs/Author.md)
The the author of the message.

<br>
<hr>
<br>

## **EditedThreadMessage.embeds**: {[Embed](/docs/Embed.md)} | {}
A list of embedded content attached to the message.

<br>
<hr>
<br>

## **EditedThreadMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}
A list of reactions to the message.

<br>
<hr>
<br>

## **EditedThreadMessage.mentions**: {[User](/docs/User.md)} | {}
A list of users specifically mentioned in the message.

<br>
<hr>
<br>

## **EditedThreadMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}
A list of role ids specifically mentioned in the message.

<br>
<hr>
<br>

## **EditedThreadMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br>
<hr>
<br>

## **EditedThreadMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions everyone.

<br>
<hr>
<br>

## **EditedThreadMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br>
<hr>
<br>

## **EditedThreadMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was sent in ISO8601 format.

<br>
<hr>
<br>

## **EditedThreadMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
The message's flags combined as a bitfield.

<br>
<hr>
<br>

## **EditedThreadMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's id.

<br>
<hr>
<br>

## **EditedThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
A number that represents the approximate position of the message in a thread.

<br>
<hr>
<br>

## **EditedThreadMessage.editedTimestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was edited in ISO8601 format.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **EditedThreadMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [EditedThreadMessage](/docs/EditedThreadMessage.md)
This method returns a new EditedThreadMessage object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:<p>

- data: message data.
---