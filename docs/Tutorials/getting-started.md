# Getting Started

## Sending a basic message

At the start of any script that uses Voyager, It all starts with first storing the path to the Voager folder in a variable.

```lua linenums="1"
local Voyager = path_here.Voyager
```

Then after that we can require all the objects we need. In this case, since we only need to send a basic message to Discord we only need the [*Webhook*](../Reference/Webhook.md) object.

```lua linenums="1" hl_lines="2"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook)
```

Now we need to create a new [*Webhook*](../Reference/Webhook.md) instance to start sending messages, to do that call the webhook's "new" constructor method.

The constructor method requires 2 arguments to be passed. The first argument must be the webhook's id, and the second argument must be the webhook's token.

```lua linenums="1" hl_lines="2"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")
``` 

??? Question "How do I obtain my webhook's id and token?"
	https://discord.com/api/webhooks/**ID**/**TOKEN**

	Compare your webhook's url to the one above, that should allow you to easily find the id and token of your webhook.

<br/>

Now that we have a Webhook instance, we can send messages to Discord by using the webhook's SendMessage method.

```lua linenums="1" hl_lines="4"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:SendMessage("Hello, world!")
```

If you require a more indepth description about the webhook's SendMessage function you can find it [*here*](../Reference/Webhook.md#sendmessagecontent-embeds-queue-waitformessage-optionalsendmessageinfo).

<br>

And it's as simple as that! if you run the script, a message like the one below should appear in the webhook's channel.

<br>

<div align="center">
    <img width="80%" src="../../assets/images/tutorial/getting-started/Image1.png">
</div>

<br>

## Making something with Voyager

??? warning "This is only an example"
	Please don't actually implement this example into your games, join logging takes up queue spots on the proxy just to deliver no real important information. This is just meant to be a fun little example you can learn from.

Now lets make a script that sends a Discord message when a player joins the game.

Using the code from the previous section we already have a good amount of work done.

```lua linenums="1"
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:SendMessage("Hello, world!", nil, true, false)
```

We will need to get the players service and use it's PlayerAdded event to know when to send a message.

```lua linenums="1" hl_lines="5-7"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

Now we'll create a new [*Embed*](../Reference/Embed.md) instance.

```lua linenums="1" hl_lines="6"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()

	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

Now we'll set the embed's author using the embed's [*SetAuthor*](../Reference/Embed.md#setauthorname-url-iconurl) method.

```lua linenums="1" hl_lines="7-10"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)

	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

Now we'll give the embed some color using the embed's [*SetColor*](../Reference/Embed.md#setcolorcolor3) method

```lua linenums="1" hl_lines="11"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
    	:SetColor(Color3.fromRGB(85, 255, 127))

	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

Now we'll give the embed some fields so we can see some more information about the player using the embed's [*AddField*](../Reference/Embed.md#addfieldname-value-inline) method.

```lua linenums="1" hl_lines="12-23"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
    	:SetColor(Color3.fromRGB(85, 255, 127))
		:AddField(
			"Account Age", 
			"**" .. player.AccountAge .. "** Days"
		)
		:AddField(
			"Has Verified Badge?", 
			tostring(player.HasVerifiedBadge)
		)
		:AddField(
			"From Game", 
			"[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
		)
	
	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

Lastly we're gonna add a timestamp to the embed's footer using the embed's [*SetTimestamp*](../Reference/Embed.md#settimestampcustomtimestamp) method.

```lua linenums="1" hl_lines="24"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
    	:SetColor(Color3.fromRGB(85, 255, 127))
		:AddField(
			"From Game", 
			"[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
		)
		:AddField(
			"Account Age", 
			"**" .. player.AccountAge .. "** Days"
		)
		:AddField(
			"Has Verified Badge?", 
			tostring(player.HasVerifiedBadge)
		)
    	:SetTimestamp()

	webhook:SendMessage("Hello, world!", nil, true, false)
end)
```

And now we can edit the SendMessage method to send the message.

```lua linenums="1" hl_lines="26"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
    	:SetColor(Color3.fromRGB(85, 255, 127))
		:AddField(
			"From Game", 
			"[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
		)
		:AddField(
			"Account Age", 
			"**" .. player.AccountAge .. "** Days"
		)
		:AddField(
			"Has Verified Badge?", 
			tostring(player.HasVerifiedBadge)
		)
    	:SetTimestamp()

    webhook:SendMessage(nil, { embed })
end)
```

Lastly we'll add some basic error handling.

```lua linenums="1" hl_lines="28-30"
local playerService = game:GetService("Players")
local Voyager = game:GetService("ServerStorage").Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

playerService.PlayerAdded:Connect(function(player : Player)
	local embed = require(Voyager.Embed).new()
    	:SetAuthor(
			player.DisplayName .. " Joined!", 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
    	:SetColor(Color3.fromRGB(85, 255, 127))
		:AddField(
			"From Game", 
			"[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
		)
		:AddField(
			"Account Age", 
			"**" .. player.AccountAge .. "** Days"
		)
		:AddField(
			"Has Verified Badge?", 
			tostring(player.HasVerifiedBadge)
		)
    	:SetTimestamp()
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

<div align="center">
    <img width="80%" src="../../assets/images/tutorial/sending-messages/Image1.png">
</div>

## Real use example

Here's an actual example of how Voyager can be used in a live game.

```lua linenums="1" title="examples/gamepassPurchaseNotification.server.lua"
--8<-- "examples/gamepassPurchaseNotification.server.lua"
```

<div align="center">
    <img width="80%" src="../../assets/images/tutorial/sending-messages/Image2.png">
</div>