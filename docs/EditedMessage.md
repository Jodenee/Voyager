# <p style="text-align: center;">**EditedMessage**</p>

<br>

# <p style="text-align: center;">*Properties*</p>

<br>

## <p style="text-align: left;">**EditedMessage.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.messageType**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p style="text-align: left;">The type of message.</p>
---

<br>

## <p style="text-align: left;">**EditedMessage.content**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The content of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.channelId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the channel the message was sent in.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.author**: [Author](/docs/Author.md)</p>
### <p style="text-align: left;">The the author of the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.embeds**: {[Embed](/docs/Embed.md)} | {}</p>
### <p style="text-align: left;">A list of embedded content attached to the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.reactions**: {[Reaction](/docs/Reaction.md)} | {}</p>
### <p style="text-align: left;">A list of reactions to the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.mentions**: {[User](/docs/User.md)} | {}</p>
### <p style="text-align: left;">A list of users specifically mentioned in the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.mentionRoles**: {[string](https://create.roblox.com/docs/scripting/luau/strings)} | {}</p>
### <p style="text-align: left;">A list of role ids specifically mentioned in the message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.pinned**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message is pinned.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.mentionEveryone**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message mentions everyone.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)</p>
### <p style="text-align: left;">Whether the message was a TTS message.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.timestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">When the message was sent in ISO8601 format.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.flags**: [number](https://create.roblox.com/docs/scripting/luau/numbers)</p>
### <p style="text-align: left;">The message's flags combined as a bitfield.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.webhookId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The webhook's id.</p>
---
<br>

## <p style="text-align: left;">**EditedMessage.editedTimestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">When the message was edited in ISO8601 format.</p>
---

<br>
<br>

# <p style="text-align: center;">*Methods*</p>

<br>
<br>

## <p style="text-align: left;">**EditedMessage.new**(data: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [EditedMessage](/docs/EditedMessage.md)</p>
### <p style="text-align: left;">This method returns a new EditedMessage object.</p>

*<p style="text-align: left;">Note: This method is not meant to be called outside of Discohook's internal code.</p>*

### Parameters:

- data: message data.
---