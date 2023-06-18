# Error Handling

## Why should I handle these errors?

Not having any logic in place to handle errors is very bad practice, as data integrity may be compromised leading to your script possibly breaking. Error handling will ensure your script works as intended, so it is vital to add some basic error handling logic to your script when using Voyager.

## Basic error handling

```lua linenums="1"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:execute("Hello, World!")
```

All of the webhook's functions excluding some private ones return a [*RequestStatus*](../API-Reference/Webhook.md) table. With this table you can easily handle any error that may occur.

First we have to put the [*RequestStatus*](../API-Reference/Webhook.md) table into a variable

```lua linenums="1" hl_lines="4"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local _, requestStatus = webhook:execute("Hello, World!")
```

The reason we put a _ before requestStatus is because execute can return a Message or ThreadMessage object but since waitForMessage is false it wont. And since it wont it'll return nil so we name it _ to show it'll not be used.

Now we can check if the request was successfuly sent to the proxy.

```lua linenums="1" hl_lines="6-10"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local _, requestStatus = webhook:execute("Hello, World!")

if requestStatus.success then
    print("The message was sent!")
else
    warn("The message wasn't sent.")
end
```

And just like that we've set up basic error handling! The same thing can be done with :editMessage and :deleteMessage as well.

## Advanced error handling

Lets say we want to send a message to Discord and print that message's id. The code would look something like this.

```lua linenums="1"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local message = webhook:execute("Hello, World!", nil, false, true)

print(message.id)
```

But doing this very unsafe as the request isn't guaranteed to be sent successfuly 100% of the time. And since the request isn't guaranteed to be sent the message variable may be nil, causing the script to error.

Now we can set up some logic to prevent that from happening. First we should put the [*RequestStatus*](../API-Reference/Webhook.md) table into a variable.

```lua linenums="1" hl_lines="4"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local message, requestStatus = webhook:execute("Hello, World!", nil, false, true)

print(message.id)
```

Now that we have the [*RequestStatus*](../API-Reference/Webhook.md) table we can set up the basic logic

```lua linenums="1" hl_lines="6-10"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local message, requestStatus = webhook:execute("Hello, World!", nil, false, true)

if requestStatus.success then
    print(message.id)
else
    warn("The message wasn't successfuly sent.")
end
```

Now we can take things a step further by handling specific HTTP errors like 429, 400, 500, 503, etc differently.

```lua linenums="1" hl_lines="6-20"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

local message, requestStatus = webhook:execute("Hello, World!", nil, false, true)

if requestStatus.success then
    print(message.id)
else
    if requestStatus.statusCode == 400 then
        warn("Bad request!")
    elseif requestStatus.statusCode == 429 then
        warn("We've been ratelimited!")
    elseif requestStatus.statusCode == 500 then
        warn("Internal server error!")
    elseif requestStatus.statusCode == 503 then
        warn("The proxy is down!")
    else
        warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
    end
end
```

And just like that the script is now ready to handle any error it may come across.