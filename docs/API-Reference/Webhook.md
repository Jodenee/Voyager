# Webhook

<br />

## Types

<br />

### **RatelimitInfo**

**RatelimitInfo.XRatelimitLimit :** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers)

**RatelimitInfo.XRatelimitRemaining :** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers)

**RatelimitInfo.XRatelimitReset :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)

**RatelimitInfo.XRatelimitResetAfter :** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers)

**RatelimitInfo.XRatelimitBucket :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)

<br />

---

<br />

### **RequestStatus**

**RequestStatus.success :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)

**RequestStatus.statusCode :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)

**RequestStatus.statusMessage :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)

<br />

---

<br />

## Properties

<br />

### **Webhook.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's id.

<br />

---

<br />

### **Webhook.token :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's token.

???+ danger
    Never share this with anyone! As leaking this value to someone gives them full access to your webhook.

<br />

---

<br />

### **Webhook.baseUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's base url.

<br />

---

<br />

### **Webhook.ratelimitInfo :** [*RatelimitInfo*](#ratelimitinfo)
The latest ratelimit information given to the webhook by Discord. [*Offical docs reference*](https://discord.com/developers/docs/topics/rate-limits#header-format-rate-limit-header-examples)

???+ note
    All of the values inside ratelimitInfo will be nil until you make a request to Discord via :execute, :editMessage or :deleteMessage.

??? tip
    These values can be used to avoid getting ratelimited from the proxy.

<br />

---

<br />

## Methods

<br />

### **Webhook.new**(id **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), token **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), customProxyUrl **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*Webhook*](Webhook.md)
This method returns a new Webhook object.

***Parameters***

- ***id:*** The webhook's id.
- ***token:*** The webhook's token.
- ***customProxyUrl:*** The base url of a self hosted [*WebhookProxy*](https://github.com/lewisakura/webhook-proxy). 

<br />

---

<br />

### **Webhook:execute**(content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, queue **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), waitForMessage **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), optionalExecuteInfo **:** [*OptionalExecuteInfo?*](OptionalExecuteInfo.md)) **:** ([*Message?*](Message.md) | [*ThreadMessage?*](ThreadMessage.md), [*RequestStatus*](#requeststatus))
This method sends a message to Discord.

???+ note
    If both queue and waitForMessage are true, a message object will not be returned.

???+ note
    If queue is left nil it will default to true. If waitForMessage is left nil it will default to false.

??? tip
    If you dont feel like making your own ratelimit handler set queue to true. This will ensure the message is sent to Discord. The only down side is it may take a few more seconds to show up depending on how busy the queue is.

***Parameters***

- ***content:*** The message's content.
- ***embeds:*** A table of embeds that'll be attached to the message.
- ***queue:*** Whether to queue the request, this will make sure the message is sent.
- ***waitForMessage:*** Whether to wait for the message to be returned. If this is set to true a Message or ThreadMessage object will be returned depending on where the message was sent.
- ***optionalExecuteInfo:*** Optional extra information for the request.

<br />

---

<br />

### **Webhook:editMessage**(messageId **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, threadId **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** ([*EditedMessage*](EditedMessage.md) | [*EditedThreadMessage*](EditedThreadMessage.md), [*RequestStatus*](#requeststatus))
This method edits a message sent by the webhook.

***Parameters***

- ***messageId:*** The message you wanna edit's id.
- ***content:*** The new content that'll override the old content.
- ***embeds:*** The new embeds that'll override the old embeds.
- ***threadId:*** The id of the thread the message is in.

<br />

---

<br />

### **Webhook:deleteMessage**(messageId **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), threadId **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*RequestStatus*](#requeststatus)
This method deletes a message sent by the webhook.

***Parameters***

- ***messageId:*** The message you wanna delete's id.
- ***threadId:*** The id of the thread the message is in.

<br />

---

<br />

### **Webhook:_validateExecuteRequest**(content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, optionalExecuteInfo **:** [*OptionalExecuteInfo?*](OptionalExecuteInfo.md)) **:** ([*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), [*string?*](https://create.roblox.com/docs/scripting/luau/strings))
This method validates data given to :execute before sending it to Discord. This is done to avoid making pointless requests to the proxy and Discord.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

***Parameters***

- ***content:*** The content of the message.
- ***embeds:*** A table of [*Embed*](Embed.md) objects.
- ***optionalExecuteInfo:*** A [*OptionalExecuteInfo*](OptionalExecuteInfo.md) object.

<br />

---

<br />

### **Webhook:_validateEditMessageRequest**(content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?) **:** ([*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), [*string?*](https://create.roblox.com/docs/scripting/luau/strings))
This method validates data given to :editMessage before sending it to Discord. This is done to avoid making pointless requests to the proxy and Discord.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

***Parameters***

- ***content:*** The content of the execute request.
- ***embeds:*** The embeds of the execute request.

<br />

---

<br />

### **Webhook:_request**(url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), method **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), body **:** {}?, contentType **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** ({}?, [*RequestStatus*](#requeststatus))
This method is used to make HTTP requests to the proxy. While this method is not meant to be used outside Voyager's internal code, if you know what you're doing, it can be used to send requests to endpoints not yet implemented to Voyager yet.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

***Parameters***

- ***url:*** The url the request will be sent to.
- ***method:*** The HTTP method needed to make the request.
- ***body:*** The body of the request.
- ***contentType:*** The content type to use in the request header.

<br />

---

<br />