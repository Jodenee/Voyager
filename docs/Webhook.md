# <p style="text-align: center;">**Webhook**</p>

<br>

# <p style="text-align: center;">*Properties*</p>

<br>

## <p style="text-align: left;">**Webhook.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The id of the webhook.</p>
---
<br>

## <p style="text-align: left;">**Webhook.token**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The token of the webhook.</p>
---
<br>

## <p style="text-align: left;">**Webhook.baseUrl**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p style="text-align: left;">The baseUrl of the webhook.</p>
---
<br>

## <p style="text-align: left;">**Webhook.Enum**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)</p>
### <p style="text-align: left;">A dictionary full of enums for Discohook.</p>
---
<br>
<br>

# <p style="text-align: center;">*Methods*</p>
<br>
<br>

## <p style="text-align: left;">**Webhook.new**(id: [string](https://create.roblox.com/docs/scripting/luau/strings), token: [string](https://create.roblox.com/docs/scripting/luau/strings)): Webhook</p>
### <p style="text-align: left;">This function returns a new Webhook object.</p>
---
<br>

## <p style="text-align: left;">**Webhook:_validateExecuteRequest**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?): ([boolean](https://create.roblox.com/docs/scripting/luau/booleans), [string](https://create.roblox.com/docs/scripting/luau/strings)?)</p>
### <p style="text-align: left;">This function validates execute requests to avoid making pointless request to discord.</p>
---
<br>

## <p style="text-align: left;">**Webhook:execute**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, queue: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), waitForMessage: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), optionalExecuteInfo: OptionalExecuteInfo?): Message? | ThreadMessage?</p>
### <p style="text-align: left;">This function sends a message to discord.</p>
---
<br>

## <p style="text-align: left;">**Webhook:editMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?): EditedMessage? | EditedThreadMessage?</p>
### <p style="text-align: left;">This function edits a message sent by the webhook.</p>
---
<br>

## <p style="text-align: left;">**Webhook:deleteMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?)</p>
### <p style="text-align: left;">This function deletes a message sent by the webhook.</p>
---