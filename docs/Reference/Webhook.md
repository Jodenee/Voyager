# Webhook
Represents a Discord webhook.

<br />

## Types

---

<br />

## RatelimitInformation

| Key            | Type                                                                              | Description                                                              |
|----------------|-----------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Limit          | [*number*](https://create.roblox.com/docs/scripting/luau/numbers)                 | The maximum amount of requests you can make.                             |
| Remaining      | [*number*](https://create.roblox.com/docs/scripting/luau/numbers)                 | The remaining amount of requests you can make.                           |
| Reset          | [*Datetime*](https://create.roblox.com/docs/reference/engine/datat ypes/DateTime) | Represents the timestamp of when the ratelimit bucket resets.            |
| ResetAfter     | [*number*](https://create.roblox.com/docs/scripting/luau/numbers)                 | The exact time in **seconds** to wait until the ratelimit bucket resets. |
| ResetAfterSafe | [*number*](https://create.roblox.com/docs/scripting/luau/numbers)                 | Same as `ResetAfter` but with 0.5 seconds of delay added.                |
| Bucket         | [*string*](https://create.roblox.com/docs/scripting/luau/strings)                 | The current ratelimit bucket id.                                         |

??? info "RatelimitInformation Vs RatelimitedInformation"
    **RatelimitInformation** is used to prevent getting ratelimited from the proxy, while **RatelimitedInformation** is used to handle a ratelimit response.

<br />

---

<br />

## RatelimitedInformation

| Key            | Type                                                              | Description                                                                   |
|----------------|-------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Scope          | [*string*](https://create.roblox.com/docs/luau/strings)           | The scope you are ratelimited from.                                           |
| RetryAfter     | [*number*](https://create.roblox.com/docs/scripting/luau/numbers) | The exact time in **milliseconds** until you are able to send messages again. |
| RetryAfterSafe | [*number*](https://create.roblox.com/docs/scripting/luau/numbers) | Same as `RetryAfter` but with 0.5 seconds of delay added.                     |

??? info "RatelimitInformation Vs RatelimitedInformation"
    **RatelimitInformation** is used to prevent getting ratelimited from the proxy, while **RatelimitedInformation** is used to handle a ratelimit response.

<br />

---

<br />

## ProxyInformation

| Key            | Type                                                               | Description                                                        |
|----------------|--------------------------------------------------------------------|--------------------------------------------------------------------|
| Proxy          | [*true?*](https://create.roblox.com/docs/scripting/luau/booleans)  | If proxy is true, the proxy isn't responsible for 4xx HTTP errors. |
| Message        | [*string?*](https://create.roblox.com/docs/scripting/luau/strings) | A message from the proxy.                                          |
| Reason         | [*string?*](https://create.roblox.com/docs/scripting/luau/strings) | A reason for your ban.                                             |
| Error          | [*string?*](https://create.roblox.com/docs/scripting/luau/strings) | An error message.                                                  |

<br />

---

<br />

## RequestStatus

| Key                  | Type                                                                                                      | Description                             |
|----------------------|-----------------------------------------------------------------------------------------------------------|-----------------------------------------|
| Success              | [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)                                       | Indicates if the request succeeded.     |
| StatusCode           | [*number*](https://create.roblox.com/docs/scripting/luau/numbers)                                         | Contains the request's status code.     |
| StatusMessage        | [*string*](https://create.roblox.com/docs/scripting/luau/strings)                                         | Contains the request's status message.  |
| ProxyInformation     | [*ProxyInformation?*](#proxyinformation)                                                                  | Contains information sent by the proxy. |
| RatelimitInformation | ([*RatelimitInformation*](#ratelimitinformation) \| [*RatelimitedInformation*](#ratelimitedinformation))? | Contains information on ratelimiting.   |

??? note 
    RatelimitInformation will contain a table of type [*RatelimitedInformation*](#ratelimitedinformation) if the StatusCode returned is 429. Otherwise it will be a table of type [*RatelimitInformation*](#ratelimitinformation).

<br />

---

<br />

## Properties

---

<br />


### Id 
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the webhook's id.

<br />

---

<br />

### Token
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the webhook's token.

???+ danger
    Never share this with **anyone**! If this string is made public it gives everyone full access to your webhook. If you think someone has your webhook's token the best course of action to take is to delete the webhook and create a new one.

<br />

---

<br />

### BaseUrl
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the webhook's base url.

???+ danger
    Never share this with **anyone**! If this string is made public it gives everyone full access to your webhook. If you think someone has your webhook's token the best course of action to take is to delete the webhook and create a new one.

<br />

---

<br />

## Constructors

---

<br />

### new(id, token, customProxyUrl)
Constructs a new [*Webhook*](Webhook.md) instance from an id, token and an optional custom proxy url. Returns a new [*Webhook*](Webhook.md) instance.

??? info "Custom proxy url example"
    "https://webhook.lewisakura.moe"

***Parameters***

- id : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The webhook's id.
- token : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The webhook's token.
- customProxyUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The base url of a self hosted [*WebhookProxy*](https://github.com/lewisakura/webhook-proxy).

<br />

---

<br />

### fromUrl(webhookUrl, customProxyUrl)
Constructs a new [*Webhook*](Webhook.md) instance from a webhook url and an optional custom proxy url. Returns a new [*Webhook*](Webhook.md) instance.

??? info "Custom proxy url example"
    "https://webhook.lewisakura.moe"

***Parameters***

- webhookUrl : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - A webhook url.
- customProxyUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The base url of a self hosted [*WebhookProxy*](https://github.com/lewisakura/webhook-proxy).

<br />

---

<br />

## Methods

---

<br />

### SendMessage(content, embeds, queue, waitForMessage, optionalSendMessageInfo)
Sends a message to the webhook's channel. Returns a tuple containing 2 items, an optional [*Message*](Message.md) instance and a table of type [*RequestStatus*](#requeststatus).
    
???+ info "Default Parameter Values"
    queue: `true`

    waitForMessage: `false`

??? info
    If both `queue` and `waitForMessage` are true, a message object will NOT be returned.

    If `queue` is true, RequestStatus.RatelimitInformation **will** be [*nil*](https://create.roblox.com/docs/luau/nil).

??? tip
    If you dont feel like making your own ratelimit handler set queue to true. This will ensure the message is sent to Discord. The only down side is it may take a few more seconds to be sent depending on how busy the proxy's queue is.

***Parameters***

- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The message's content.
- embeds : { [*Embed*](Embed.md) }? - Embeds that'll be attached to the message.
- queue : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether to queue the request.
- waitForMessage : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether to wait for a [*Message*](Message.md) instance to be returned.
- optionalSendMessageInfo : [*OptionalSendMessageInfo?*](OptionalSendMessageInfo.md) - Contains extra information for the request.

<br />

---

<br />

### SendMessageInThread(threadId, content, embeds, queue, waitForMessage, optionalSendMessageInfo)
Sends a message to a thread in the webhook's channel. Returns a tuple containing 2 items, an optional [*Message*](Message.md) instance and a table of type [*RequestStatus*](#requeststatus).
    
???+ info "Default Parameter Values"
    queue: `true`

    waitForMessage: `false`

??? info
    If both `queue` and `waitForMessage` are true, a message object will NOT be returned.

    If `queue` is true, RequestStatus.RatelimitInformation **WILL** be null.

??? tip
    If you dont feel like making your own ratelimit handler set queue to true. This will ensure the message is sent to Discord. The only down side is it may take a few more seconds to be sent depending on how busy the proxy's queue is.

***Parameters***

- threadId : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the thread the message will be sent to.
- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The message's content.
- embeds : { [*Embed*](Embed.md) }? - Embeds that'll be attached to the message.
- queue : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether to queue the request.
- waitForMessage : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether to wait for a [*Message*](Message.md) instance to be returned.
- optionalSendMessageInfo : [*OptionalSendMessageInfo?*](OptionalSendMessageInfo.md) - Contains extra information for the request.

<br />

---

<br />

### EditMessage(messageId, content, embeds)
Edits a message sent by the webhook. Returns a tuple containing 2 items, a [*Message*](Message.md) instance and a table of type [*RequestStatus*](#requeststatus).

***Parameters***

- messageId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the message.
- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The new content.
- embeds : { [*Embed*](Embed.md) }? - The new embeds.

<br />

---

<br />

### EditMessageInThread(threadId, messageId, content, embeds)
Edits a message in a thread sent by the webhook. Returns a tuple containing 2 items, a [*Message*](Message.md) instance and a table of type [*RequestStatus*](#requeststatus).

***Parameters***

- threadId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the thread the message is in.
- messageId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the message.
- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The new content.
- embeds : { [*Embed*](Embed.md) }? - The new embeds.

<br />

---

<br />

### DeleteMessage(messageId)
Deletes a message sent by the webhook. Returns a table of type [*RequestStatus*](#requeststatus).

***Parameters***

- messageId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the message.

<br />

---

<br />

### DeleteMessageInThread(threadId, messageId)
Deletes a message in a thread sent by the webhook. Returns a table of type [*RequestStatus*](#requeststatus).

***Parameters***

- threadId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the thread the message is in.
- messageId : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The id of the message.

<br />

---

<br />

### _ValidateSendMessageRequest(content, embeds, optionalExecuteInfo)
Validates the request to avoid making a bad request to Discord. Returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

***Parameters***

- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The content of the message.
- embeds : { [*Embed*](Embed.md) }? - Embeds that'll be attached to the message.
- optionalExecuteInfo : [*OptionalSendMessageInfo?*](OptionalSendMessageInfo.md) - Any extra info for the request.

<br />

---

<br />

### _ValidateEditMessageRequest(content, embeds)
Validates the request to avoid making a bad request to Discord. Returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

***Parameters***

- content : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The new content of the message.
- embeds : { [*Embed*](Embed.md) }? - The new embeds that'll be attached to the message.

<br />

---

<br />

### _Request(url, method, body, contentType)
This method is used to make HTTP requests to the proxy. Returns a tuple containing 2 items, a table containing the response body and a table of type [*RequestStatus*](#requeststatus).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The url the request will be sent to.
- method : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The HTTP method.
- body : {}? - The body of the request.
- contentType : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The content type of the request.

<br />

---

<br />