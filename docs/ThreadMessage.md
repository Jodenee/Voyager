# <p align = "center">**ThreadMessage**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**ThreadMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">The type of message.</p>
---

<br>

## <p align = "left">**ThreadMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The content of the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the channel the message was sent in.</p>
---
<br>

## <p align = "left">**ThreadMessage.author**: [Author](/docs/Author.md)</p>
### <p align = "left">The the author of the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.embeds**: {[Embed](/docs/Embed.md)} | {}</p>
### <p align = "left">A list of embedded content attached to the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}</p>
### <p align = "left">A list of reactions to the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.mentions**: {[User](/docs/User.md)} | {}</p>
### <p align = "left">A list of users specifically mentioned in the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}</p>
### <p align = "left">A list of role ids specifically mentioned in the message.</p>
---
<br>

## <p align = "left">**ThreadMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message is pinned.</p>
---
<br>

## <p align = "left">**ThreadMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message mentions everyone.</p>
---
<br>

## <p align = "left">**ThreadMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p align = "left">Whether the message was a TTS message.</p>
---
<br>

## <p align = "left">**ThreadMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">When the message was sent in ISO8601 format.</p>
---
<br>

## <p align = "left">**ThreadMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">The message's flags combined as a bitfield.</p>
---
<br>

## <p align = "left">**ThreadMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The webhook's id.</p>
---
<br>

## <p align = "left">**ThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p align = "left">A number that represents the approximate position of the message in a thread.</p>
---

<br>
<br>

# <p align = "center">*Methods*</p>

<br>
<br>

## <p align = "left">**ThreadMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [ThreadMessage](/docs/ThreadMessage.md)</p>
### <p align = "left">This method returns a new ThreadMessage object.</p>

*<p align = "left">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### <p align = "left">Parameters:<p>

- data: message data.
---