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

???+ warning "Deprecation Notice"
    This type has been deprecated. Please use [RatelimitInformation](#ratelimitinformation) and [RatelimitedInformation](#ratelimitedinformation) instead. 

---

<br />

### **RatelimitInformation**

Please use the [offical Discord](https://discord.com/developers/docs/topics/rate-limits#header-format-rate-limit-header-examples) docs to reference what these values represent. 

**RatelimitInformation.limit :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)

**RatelimitInformation.remaining :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)

**RatelimitInformation.reset :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)

**RatelimitInformation.resetAfter :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers) (In seconds)

**RatelimitInformation.resetAfterSafe :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers) *(same as resetAfter, just with one extra second added)*

**RatelimitInformation.bucket :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)

??? info
    The difference between [RatelimitInformation](#ratelimitinformation) and [RatelimitedInformation](#ratelimitedinformation) is, RatelimitInformation is used to prevent getting ratelimited from the proxy, while RatelimitedInformation is used to handle a ratelimit responce from the proxy.

???+ warning
    Logical errors **must** be avoided when handling ratelimits yourself, as you may end up sending too many requests and getting either ratelimited or, banned from the proxy.

<br />

---

<br />

### **RatelimitedInformation**

Please use the [offical Discord](https://discord.com/developers/docs/topics/rate-limits#exceeding-a-rate-limit-rate-limit-response-structure) docs to reference what these values represent. 

**RatelimitedInformation.global :** [*boolean*](https://create.roblox.com/docs/luau/booleans)

**RatelimitedInformation.scope :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)

**RatelimitedInformation.retryAfter :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers) (In milliseconds)

**RatelimitedInformation.retryAfterSafe :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers) *(same as retryAfter, just with one extra second added)*

??? info
    The difference between [RatelimitInformation](#ratelimitinformation) and [RatelimitedInformation](#ratelimitedinformation) is, RatelimitInformation is used to prevent getting ratelimited from the proxy, while RatelimitedInformation is used to handle a ratelimit responce from the proxy.

???+ warning
    Logical errors **must** be avoided when handling ratelimits yourself, as you may end up sending too many requests and getting banned from the proxy.

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
    Never share this with **anyone**! If this value is made public all a malicious actor needs is your webhook's id which can be easily retrieved. Then you are at their mercy.

<br />

---

<br />

### **Webhook.baseUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The webhook's base url.

???+ danger
    Never share this with **anyone**! If this value is made public it gives everyone with access to the value full access to your webhook. Then you are at their mercy. If you think someone has your webhook's url the best course of action is to delete it and create a new one.

<br />

---

<br />

### **Webhook.ratelimitInfo :** [*RatelimitInfo*](#ratelimitinfo)
The latest ratelimit information given to the webhook by Discord. [*Offical docs reference*](https://discord.com/developers/docs/topics/rate-limits#header-format-rate-limit-header-examples)

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use [RatelimitInformation](#ratelimitinformation) returned by :execute, :editMessage and :deleteMessage instead. 

??? note
    ratelimitInfo will be nil until you make a request to Discord via :execute, :editMessage or :deleteMessage.

??? tip
    These values can be utilised to prevent getting ratelimited from the proxy.

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
- ***customProxyUrl:*** The base url of a self hosted [*WebhookProxy*](https://github.com/lewisakura/webhook-proxy). (*example: "https://webhook.lewisakura.moe"*)

<br />

---

<br />

### **Webhook.fromUrl**(webhookUrl **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), customProxyUrl **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*Webhook*](Webhook.md)
This method returns a new Webhook object.

???+ note
    The webhookUrl param should be a normal Discord webhook url.

***Parameters***

- ***webhookUrl:*** The url of your webhook.
- ***customProxyUrl:*** The base url of a self hosted [*WebhookProxy*](https://github.com/lewisakura/webhook-proxy). (*example: "https://webhook.lewisakura.moe"*)

<br />

---

<br />

### **Webhook:execute**(content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, queue **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), waitForMessage **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), optionalExecuteInfo **:** [*OptionalExecuteInfo?*](OptionalExecuteInfo.md)) **:** ([*Message?*](Message.md) | [*ThreadMessage?*](ThreadMessage.md), [*RequestStatus*](#requeststatus), [*RatelimitInformation*](#ratelimitinformation) | [*RatelimitedInformation*](#ratelimitedinformation) | {})
This method sends a message to Discord.

???+ note
    If both queue and waitForMessage are true, a message object will NOT be returned.

???+ note
    If queue is left nil it will default to true. If waitForMessage is left nil it will default to false.

???+ note
    If queue is true, ratelimitInfo will **NOT** be returned.

??? tip
    If you dont feel like making your own ratelimit handler set queue to true. This will ensure the message is sent to Discord. The only down side is it may take a few more seconds to be sent depending on how busy the proxy's queue is.

***Parameters***

- ***content:*** The message's content.
- ***embeds:*** A table of embeds that'll be attached to the message.
- ***queue:*** Whether to queue the request, this will make sure the message is sent.
- ***waitForMessage:*** Whether to wait for the message to be returned. If this is set to true a Message or ThreadMessage object will be returned depending on where the message was sent.
- ***optionalExecuteInfo:*** Optional extra information for the request.

<br />

---

<br />

### **Webhook:editMessage**(messageId **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, threadId **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** ([*EditedMessage*](EditedMessage.md) | [*EditedThreadMessage*](EditedThreadMessage.md), [*RequestStatus*](#requeststatus), [*RatelimitInformation*](#ratelimitinformation) | [*RatelimitedInformation*](#ratelimitedinformation))
This method edits a message sent by the webhook.

***Parameters***

- ***messageId:*** The id of the message you wanna edit.
- ***content:*** The new content that'll override the old content.
- ***embeds:*** The new embeds that'll override the old embeds.
- ***threadId:*** The id of the thread the message is in.

<br />

---

<br />

### **Webhook:deleteMessage**(messageId **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), threadId **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** ([*RequestStatus*](#requeststatus), [*RatelimitInformation*](#ratelimitinformation) | [*RatelimitedInformation*](#ratelimitedinformation))
This method deletes a message sent by the webhook.

***Parameters***

- ***messageId:*** The id of the message you wanna delete.
- ***threadId:*** The id of the thread the message is in.

<br />

---

<br />

### **Webhook:_validateExecuteRequest**(content **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), embeds **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}?, optionalExecuteInfo **:** [*OptionalExecuteInfo?*](OptionalExecuteInfo.md)) **:** ([*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), [*string?*](https://create.roblox.com/docs/scripting/luau/strings))
This method validates data given to :execute before sending it to the proxy. This is done to avoid making pointless requests to the proxy.

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
This method validates data given to :editMessage before sending it to the proxy. This is done to avoid making pointless requests to the proxy.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

***Parameters***

- ***content:*** The content of the execute request.
- ***embeds:*** The embeds of the execute request.

<br />

---

<br />

### **Webhook:_request**(url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), method **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), body **:** {}?, contentType **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** ({}?, [*RequestStatus*](#requeststatus), [*RatelimitInformation*](#ratelimitinformation) | [*RatelimitedInformation*](#ratelimitedinformation) | { })
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