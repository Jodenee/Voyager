# Error Handling

???+ question "Why should I handle these errors?"
    Not having any logic in place to handle errors is very bad practice, as data integrity may be compromised leading to your script possibly breaking. Error handling will ensure your script works as intended, so it is vital to add some basic error handling logic to your script when using Voyager.

## Basic error handling

```lua linenums="1"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

webhook:SendMessage("Hello, World!")
```

All of the webhook's methods excluding some private ones return a second item, a table of type [*RequestStatus*](../Reference/Webhook.md#requeststatus). With this table you can easily handle any error that may occur.

First we have to put the [*RequestStatus*](../Reference/Webhook.md#requeststatus) table into a variable.

```lua linenums="1" hl_lines="4"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local _, requestStatus = webhook:SendMessage("Hello, World!")
```

The reason we put a _ before requestStatus is because SendMessage can return a Message instance but since the waitForMessage paramater is false by defualt, it wont. And since it wont, the first item will be nil so we name it _ to show it'll not be used.

Now we can check if the request was successfuly sent to the proxy.

```lua linenums="1" hl_lines="6-10"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local _, requestStatus = webhook:SendMessage("Hello, World!")

if requestStatus.Success then
    print("The message was sent!")
else
    warn("The message wasn't sent.")
end
```

And just like that we've set up basic error handling! The same thing can be done with [*EditMessage*](../Reference/Webhook.md#editmessagemessageid-content-embeds), [*EditMessageInThread*](../Reference/Webhook.md#editmessageinthreadthreadid-messageid-content-embeds), [*DeleteMessage*](../Reference/Webhook.md#deletemessagemessageid), [*DeleteMessageInThread*](../Reference/Webhook.md#deletemessageinthreadthreadid-messageid) as well.

## Advanced error handling

Lets say we want to send a message to Discord and print that message's id. The code would look something like this.

```lua linenums="1"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local message = webhook:SendMessage("Hello, World!", nil, false, true)

print(message.Id)
```

But this code is actually very unsafe as the request isn't guaranteed to be sent successfuly 100% of the time. And since the request isn't guaranteed to be sent the message variable may be nil, causing the script to error.

Now we can set up some logic to prevent that from happening. First we should put the [*RequestStatus*](../Reference/Webhook.md#requeststatus) table into a variable.

```lua linenums="1" hl_lines="4"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local message, requestStatus = webhook:SendMessage("Hello, World!", nil, false, true)

print(message.Id)
```

Now that we have the [*RequestStatus*](../Reference/Webhook.md#requeststatus) table we can check to make sure the message was sent successfully.

```lua linenums="1" hl_lines="6-10"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local message, requestStatus = webhook:SendMessage("Hello, World!", nil, false, true)

if requestStatus.Success then
    print(message.Id)
else
    warn("The message wasn't sent.")
end
```

Now we can take things a step further by handling specific HTTP errors like 429, 400, 500, 503, etc differently.

```lua linenums="1" hl_lines="9-19"
local voyager = require(path_here.voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local message, requestStatus = webhook:SendMessage("Hello, World!", nil, false, true)

if requestStatus.Success then
    print(message.Id)
else
    if requestStatus.StatusCode == 429 then
        warn("We've been ratelimited!")
    elseif requestStatus.StatusCode == 500 then
        warn("Internal server error!")
    elseif requestStatus.StatusCode == 503 then
        warn("The proxy is down!")
    else
        warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
    end
end
```

And just like that the script is now ready to handle any error it may come across.