# <p style="text-align: center;">**EditedThreadMessage**</p>

<br>

# <p style="text-align: center;">*Properties*</p>

<br>

## <p style="text-align: left;">**EditedThreadMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p style="text-align: left;">The type of message.</p>
---

<br>

## <p style="text-align: left;">**EditedThreadMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The content of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the channel the message was sent in.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.author**: [Author](/docs/Author.md)</p>
### <p style="text-align: left;">The the author of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.embeds**: {[Embed](/docs/Embed.md)} | {}</p>
### <p style="text-align: left;">A list of embedded content attached to the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}</p>
### <p style="text-align: left;">A list of reactions to the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.mentions**: {[User](/docs/User.md)} | {}</p>
### <p style="text-align: left;">A list of users specifically mentioned in the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}</p>
### <p style="text-align: left;">A list of role ids specifically mentioned in the message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message is pinned.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message mentions everyone.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message was a TTS message.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">When the message was sent in ISO8601 format.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p style="text-align: left;">The message's flags combined as a bitfield.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The webhook's id.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p style="text-align: left;">A number that represents the approximate position of the message in a thread.</p>
---
<br>

## <p style="text-align: left;">**EditedThreadMessage.editedTimestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">When the message was edited in ISO8601 format.</p>
---

<br>
<br>

# <p style="text-align: center;">*Methods*</p>

<br>
<br>

## <p style="text-align: left;">**EditedThreadMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [EditedThreadMessage](/docs/EditedThreadMessage.md)</p>
### <p style="text-align: left;">This method returns a new EditedThreadMessage object.</p>

*<p style="text-align: left;">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### Parameters:

- data: message data.
---