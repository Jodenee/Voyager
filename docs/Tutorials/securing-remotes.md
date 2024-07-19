# Securing Remotes

???+ question "Why should I secure my remotes?"
	Not securing your remotes is a massive security vulnerability. Exploiters can easily spam remote events that send messages to discord until you either get ratelimited or flatout banned from the proxy. So it is crucial secure your remotes to prevent this from happening.

## Basic remote security

To show you how to secure a remote the user feedback example will be used.

The way we will prevent exploiters from spamming our remote is by putting players on cooldown when they fire the remote. So if a player fires the remote it'll put them on a cooldown and until the cooldown duration has passed they will not be able to send anymore feedback.

```lua linenums="1" title="examples/playerFeedback.server.lua"
--8<-- "examples/playerFeedback.server.lua"
```

First we will make 2 new variables, the first one will be a table that stores timestamps and the second variable will store a number that'll contain the cooldown duration in seconds.

```lua linenums="1" hl_lines="6-7"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetTimestamp()
		:AddField("Account Age", "**" .. player.AccountAge .. "** Days", true)
		:AddField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
		:AddField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

Now we will need to make a function that'll check if a player can send feedback or not. The way it will decide if someone can send a message is by subtracting the current timestamp by their timestamp. Their timestamp represents when they last sent feedback so the difference will represent the time in seconds since the user sent feedback, then we just need to check if that difference is more or equal to the cooldownDuration variable.

```lua linenums="1" hl_lines="9-17"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetTimestamp()
		:AddField("Account Age", "**" .. player.AccountAge .. "** Days", true)
		:AddField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
		:AddField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

Now all we need to do is check if the player can send feedback using the canSendFeedback function. If they can send feedback we will put them in cooldown and set their timestamp. Also we will add a PlayerRemoving function that removes the player's cooldown from the table if they leave, otherwise the data will never be removed and will stay there until the server shuts down.

```lua linenums="1" hl_lines="24-25"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

game:GetService("Players").PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetTimestamp()
		:AddField("Account Age", "**" .. player.AccountAge .. "** Days", true)
		:AddField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
		:AddField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

And just like that we've made the exploiter's life much harder with a few lines of code. Now they can't spam the remote event anymore, but there is only one issue, they can still just rejoin the server to reset their cooldown, while this is extremely tedious some may still may attempt this. If you'd like to patch this as well check out [*advanced remote security*](#advanced-remote-security).

## Advanced remote security

### Join Lock Method

The easiest way we can solve the rejoining problem is by putting the player on cooldown when they join the game. No regular player would want to send feedback the instant they join a game so this will most likely not affect regular players.

We can do this by simply adding a PlayerAdded event and then putting the player in the playersOnCooldown table.

```lua linenums="1" hl_lines="19-21"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

game:GetService("Players").PlayerAdded:Connect(function(player : Player)
	playersOnCooldown[player] = os.time()
end)

game:GetService("Players").PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetTimestamp()
		:AddField("Account Age", "**" .. player.AccountAge .. "** Days", true)
		:AddField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
		:AddField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

### Datastore Method

Another way to solve this by storing the timestamp in a datastore, while this is more tedious to implement it allows us to set higher cooldown durations. Since the user's cooldown will still go down while they are offline, it doesn't force the user to wait for the join lock to go away just to send feedback.

A regular datastore will be used for the sake of simplicity, but this can be done with any datastore module.

First we will change cooldownDuration to last a week. Then we'll get the necessary dependencies like the Datastore and the PlayersSerivce.

```lua linenums="1" hl_lines="4-6 9"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local playerService = game:GetService("Players")
local datastoreService = game:GetService("DataStoreService")
local cooldownDatastore = datastoreService:GetDataStore("feedbackCooldown")
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playersOnCooldown = {}

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

playerService.PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetTimestamp()
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetAuthor(
			"Feedback from " .. player.DisplayName, 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
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
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

Now we'll add a PlayerAdded event, and in that event we will fetch the player's timestamp and add it to the playersOnCooldown table.

```lua linenums="1" hl_lines="22-30"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local playerService = game:GetService("Players")
local datastoreService = game:GetService("DataStoreService")
local cooldownDatastore = datastoreService:GetDataStore("feedbackCooldown")
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playersOnCooldown = {}

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then 
		warn("Unable to fetch " .. player.Name .. "'s data! " .. result)
	end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetTimestamp()
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetAuthor(
			"Feedback from " .. player.DisplayName, 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
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
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

Now we'll edit the PlayerRemoving event to save the player's timestamp before removing it from the playersOnCooldown table.

```lua linenums="1" hl_lines="32-44"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local playerService = game:GetService("Players")
local datastoreService = game:GetService("DataStoreService")
local cooldownDatastore = datastoreService:GetDataStore("feedbackCooldown")
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playersOnCooldown = {}

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then 
		warn("Unable to fetch " .. player.Name .. "'s data! " .. result)
	end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	if not playersOnCooldown[player] then return end
	
	local success, result = pcall(function()
		cooldownDatastore:SetAsync(player.UserId, playersOnCooldown[player], { player.UserId })
	end)
	
	if not success then 
		warn(player.Name "'s data was not saved! " .. result) 
	end
	
	playersOnCooldown[player] = nil
end)


sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetTimestamp()
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetAuthor(
			"Feedback from " .. player.DisplayName, 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
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
	
	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

And lasty we will add a BindToClose event to ensure data isn't lost when the server shuts down.

```lua linenums="1" hl_lines="48-62"
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

local playerService = game:GetService("Players")
local datastoreService = game:GetService("DataStoreService")
local cooldownDatastore = datastoreService:GetDataStore("feedbackCooldown")
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback

local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playersOnCooldown = {}

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end

	--[[ 
		Subtract the current time by the time the player was put on cooldown 
		and check if the difference is more or equal to the cooldownDuration variable
	]]--
	return (os.time() - playersOnCooldown[player]) >= cooldownDuration
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then 
		warn("Unable to fetch " .. player.Name .. "'s data! " .. result)
	end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	if not playersOnCooldown[player] then return end

	local success, result = pcall(function()
		cooldownDatastore:UpdateAsync(player.UserId, function(storedValue: number?, keyInfo : DataStoreKeyInfo) 
			return playersOnCooldown[player], { player.UserId }
		end)
	end)
	
	if not success then 
		warn(player.Name "'s data was not saved! " .. result) 
	end
	
	playersOnCooldown[player] = nil
end)

game:BindToClose(function()
	for _, player in playerService:GetPlayers() do
		if not playersOnCooldown[player] then continue end

		local success, result = pcall(function()
			cooldownDatastore:UpdateAsync(player.UserId, function(storedValue: number?, keyInfo : DataStoreKeyInfo) 
				return playersOnCooldown[player], { player.UserId }
			end)
		end)
		
		if not success then 
			warn(player.Name "'s data was not saved! " .. result) 
		end
	end
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetTimestamp()
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetAuthor(
			"Feedback from " .. player.DisplayName, 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
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

	local _, requestStatus = webhook:SendMessage(nil, { embed })
	
	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.StatusCode .. " " .. requestStatus.StatusMessage)
	end
end)
```

And thats it! Now our feedback example is way more robust as it cannot be spammed by exploiters anymore.