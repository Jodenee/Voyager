# Getting Started

Assuming you've followed the Installation guide in the [overview](../index.md), and have a webhook ready to go, if not follow this short [tutorial](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) by Discord. Keep your webhook url handy.

## Sending a basic message

At the start of any script that uses Voyager, It all starts with first storing the path to the Voager folder in a variable.

```lua linenums="1"
local Voyager = path_here.Voyager
```

Then after that we can require all the objects we need. In this case, since we only need to send a basic message to Discord we only need the webhook object.

```lua linenums="1" hl_lines="2"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook)
```

Now we need to make a new Webhook object to start sending messages, to do that call the Webhook object's constructor function to make a new Webhook object.

```lua linenums="1" hl_lines="2"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")
```

The constructor function (webhook.new()) requires 2 arguments to be passed. 

The first one being the webhook's Id. 

The second one being the webhook's Token. 

To obtain these values look at the webhook's url. Example: https://discord.com/api/webhooks/**id**/**token**

Now that we have a webhook object, we can send messages to Discord by using the webhook's execute function.

```lua linenums="1" hl_lines="4"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:execute("Hello, World!")
```

The execute function requires at least 1 argument, that being either the content of the message or a table of embeds. 

The first argument is content of the message. (optional)

The second argument is a table of Embed objects. (optional)

The third argument is whether we want to queue the request. If left empty it will default to true.

The forth argument is whether we want to wait for a message object to be returned. If left empty it will default to false.

The fifth argument is a [*OptionalExecuteInfo*](../API-Reference/OptionalExecuteInfo.md) object. This object is used to enable lesser used features like tts, avatar url override, thread id etc. (optional)

If you require a more indepth description about the Webhook object's execute function you can find it [*here*](../API-Reference/Webhook.md) under the methods section.

The other objects mentioned in this tutorial will be given an proper explination later in the tutorial.

<br>

And it's as simple as that! if you run the script, a message like the one below should appear in the webhook's channel.

<br>

<div align="center">
    <img width="50%" src="../../assets/images/tutorial/getting-started/Image1.png">
</div>

<br>

## Making something with Voyager

Lets make a script that sends a Discord message when a player joins your game.

Using the code from the previous tutorial we already have a good amount of work done.

```lua linenums="1"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:execute("Hello, World!", nil, true, false)
```

We will need to get the players service and use it's PlayerAdded event to execute an anonymous function.

```lua linenums="1" hl_lines="5-7"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)

end)
```

Now we'll make a new Embed object

```lua linenums="1" hl_lines="6"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
end)
```

Now we'll set the embed's author

```lua linenums="1" hl_lines="8"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

    embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
end)
```

Now we'll give the embed some color

```lua linenums="1" hl_lines="9"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

    embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
    embed:setColor(Color3.fromRGB(85, 255, 127))
end)
```

Now we'll give the embed some fields so we can see some more information about the player

```lua linenums="1" hl_lines="10-12"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

    embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
    embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
end)
```

Lastly for the embed customization, we're gonna add a timestamp to the embed's footer 

```lua linenums="1" hl_lines="13"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

    embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
    embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
    embed:setTimestamp()
end)
```

And now we can use the webhook's execute function to send the message

```lua linenums="1" hl_lines="15"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

    embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
    embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
    embed:setTimestamp()

    webhook:execute(nil, {embed})
end)
```

Lastly we'll add some basic error handling

```lua linenums="1" hl_lines="17-19"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

	embed:setAuthor(player.DisplayName .. " Joined!", "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:setTimestamp()
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

<div align="center">
    <img width="50%" src="../../assets/images/tutorial/sending-messages/Image1.png">
</div>

## Real use case

Here is a real world use case. If you dont understand what a specific function does, feel free to look it up in the docs for clarification. [*Embed docs*](../API-Reference/Embed.md)

```lua linenums="1" title="examples/gamepassPurchaseNotification.lua"
-- Put Voyager in server storage

local marketplaceService = game:GetService("MarketplaceService")
local voyager = game:GetService("ServerStorage").Voyager
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

marketplaceService.PromptGamePassPurchaseFinished:Connect(function(player : Player, gamepassid : number, wasPurchased : boolean)
	if not wasPurchased then return end
	local gamepassInfo = marketplaceService:GetProductInfo(gamepassid, Enum.InfoType.GamePass)
	local embed = require(voyager.Embed).new()
	
	embed:setAuthor(player.DisplayName .. " has purchased " .. gamepassInfo.Name, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("Gamepass Price", "**" .. gamepassInfo.PriceInRobux .. "** Robux", true)
	embed:addField("Earnings (70%)", "**" .. ((70/100) * gamepassInfo.PriceInRobux) .. "** Robux", true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:setTimestamp()

	local _, requestStatus = webhook:execute(nil, {embed}, true, false)
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

<div align="center">
    <img width="50%" src="../../assets/images/tutorial/sending-messages/Image2.png">
</div>