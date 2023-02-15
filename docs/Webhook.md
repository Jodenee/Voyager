# <p align = "center">**Webhook**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **Webhook.id**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the webhook.

<br>
<hr>
<br>

## **Webhook.token**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The token of the webhook.

<br>
<hr>
<br>

## **Webhook.baseUrl**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The baseUrl of the webhook.

<br>
<hr>
<br>

## **Webhook.Enum**: [dictionary](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)
A dictionary full of enums for Discohook.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **Webhook.new**(id: [string](https://create.roblox.com/docs/scripting/luau/strings), token: [string](https://create.roblox.com/docs/scripting/luau/strings)): [Webhook](/docs/Webhook.md)
This function returns a new Webhook object.

Parameters:

- id: The id of the webhook.
- token: The token of the webhook.

<br>
<hr>
<br>

## **Webhook:_validateExecuteRequest**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {[Embed](/docs/Embed.md)}?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?): ([boolean](https://create.roblox.com/docs/scripting/luau/booleans), [string](https://create.roblox.com/docs/scripting/luau/strings)?)
This function validates execute requests to avoid making pointless requests to discord.

*Note: This function is not meant to be used outside Discohook's internal code.*

Parameters:

- content: The content of the execute request.
- embeds: The embeds of the execute request.
- usernameOverride: The username override of the execute request.

<br>
<hr>
<br>

## **Webhook:execute**(content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {[Embed](/docs/Embed.md)}?, queue: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), waitForMessage: [boolean](https://create.roblox.com/docs/scripting/luau/booleans), optionalExecuteInfo: [OptionalExecuteInfo](/docs/OptionalExecuteInfo.md)?): [Message](/docs/Message.md)? | [ThreadMessage](/docs/ThreadMessage.md)?
This function sends a message to discord.

*Note: If queue and waitForMessage are true a message object will NOT be returned.*

Parameters:

- content: The content for the message.
- embeds: The embeds that'll be attached to the message.
- queue: Whether to queue the request. This will make sure the message is sent.
- waitForMessage: Whether to wait for the message to be returned. If this is set to true a Message or ThreadMessage object will be returned depending on where the message was sent.
- optionalExecuteInfo: Optional info for the request.

<br>
<hr>
<br>

## **Webhook:editMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), content: [string](https://create.roblox.com/docs/scripting/luau/strings)?, embeds: {[Embed]((/docs/Embed.md))}?, threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [EditedMessage](/docs/EditedMessage.md)? | [EditedThreadMessage](/docs/EditedThreadMessage.md)?
This function edits a message sent by the webhook.

Parameters:

- messageId: The id of the message.
- content: The new content.
- embeds: The new embeds that'll be attached to the message.
- threadId: The id of the thread the message is in.

<br>
<hr>
<br>

## **Webhook:deleteMessage**(messageId: [string](https://create.roblox.com/docs/scripting/luau/strings), threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?)
This function deletes a message sent by the webhook.

Parameters:

- messageId: The id of the message.
- threadId: The id of the thread the message is in.

<br>
<hr>
<br>