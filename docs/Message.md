# <p align = "center">**Message**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**Message.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the message.</p>
---
<br>

## <p align = "left">**Message.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">The type of message.</p>
---

<br>

## <p align = "left">**Message.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The content of the message.</p>
---
<br>

## <p align = "left">**Message.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the channel the message was sent in.</p>
---
<br>

## <p align = "left">**Message.author**: [Author](/docs/Author.md)</p>
### <p align = "left">The the author of the message.</p>
---
<br>

## <p align = "left">**Message.embeds**: {[Embed](/docs/Embed.md)} | {}</p>
### <p align = "left">A list of embedded content attached to the message.</p>
---
<br>

## <p align = "left">**Message.reactions**: {[Reaction](/docs/Reaction.md)} | {}</p>
### <p align = "left">A list of reactions to the message.</p>
---
<br>

## <p align = "left">**Message.mentions**: {[User](/docs/User.md)} | {}</p>
### <p align = "left">A list of users specifically mentioned in the message.</p>
---
<br>

## <p align = "left">**Message.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}</p>
### <p align = "left">A list of role ids specifically mentioned in the message.</p>
---
<br>

## <p align = "left">**Message.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message is pinned.</p>
---
<br>

## <p align = "left">**Message.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message mentions everyone.</p>
---
<br>

## <p align = "left">**Message.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message was a TTS message.</p>
---
<br>

## <p align = "left">**Message.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">When the message was sent in ISO8601 format.</p>
---
<br>

## <p align = "left">**Message.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">The message's flags combined as a bitfield.</p>
---
<br>

## <p align = "left">**Message.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The webhook's id.</p>
---

<br>
<br>

# <p align = "center">*Methods*</p>

<br>
<br>

## <p align = "left">**Message.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [Message](/docs/Message.md)</p>
### <p align = "left">This method returns a new Message object.</p>

*<p align = "left">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### <p align = "left">Parameters:<p>

- data: message data.
---