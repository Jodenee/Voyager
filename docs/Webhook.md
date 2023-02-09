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

### Parameters:

- id: The id of the webhook.
- token: The token of the webhook.
---
<br>

## <p style="text-align: left;">**Webhook:_validateExecuteRequest**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?): ([boolean](https://create.roblox.com/docs/scripting/luau/booleans), [string](https://create.roblox.com/docs/scripting/luau/strings)?)</p>
### <p style="text-align: left;">This function validates execute requests to avoid making pointless requests to discord.</p>

*<p style="text-align: left;">Note: This function is not meant to be used outside Discohook's internal code.</p>*

### Parameters:

- content: The content of the execute request.
- embeds: The embeds of the execute request.
- usernameOverride: The username override of the execute request.
---
<br>

## <p style="text-align: left;">**Webhook:execute**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, queue: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), waitForMessage: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), optionalExecuteInfo: OptionalExecuteInfo?): Message? | ThreadMessage?</p>
### <p style="text-align: left;">This function sends a message to discord.</p>

*<p style="text-align: left;">Note: If queue and waitForMessage are true a message object will NOT be returned.</p>*

### Parameters:

- content: The content for the message.
- embeds: The embeds that'll be attached to the message.
- queue: If to queue the request. This will make sure the message is sent.
- waitForMessage: If to wait for the message to be returned. This will return a message object.
- optionalExecuteInfo: optional info for the request.

---
<br>

## <p style="text-align: left;">**Webhook:editMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {Embed}?, threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?): EditedMessage? | EditedThreadMessage?</p>
### <p style="text-align: left;">This function edits a message sent by the webhook.</p>

### Parameters:

- messageId: The id of the message.
- content: The new content.
- embeds: The new embeds that'll be attached to the message.
- threadId: The id of the thread the message is in.

---
<br>

## <p style="text-align: left;">**Webhook:deleteMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?)</p>
### <p style="text-align: left;">This function deletes a message sent by the webhook.</p>

### Parameters:

- messageId: The id of the message.
- threadId: The id of the thread the message is in.

---