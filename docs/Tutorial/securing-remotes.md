# Securing Remotes

## Why should I secure my remotes?

Not securing your remotes leaves you in the mercy of exploiters. Exploiters can easily spam a remote event that sends a Discord message until you either get ratelimited or flatout banned from the proxy. So it is crucial secure your remotes to prevent this from happening.

## Basic remote security

To show you how to secure a remote the feedback example found in examples will be used.

The way we will prevent exploiters from spamming our remote is by putting players in cooldown when they fire the remote. So if a player fires the remote it'll put them on a cooldown and until the cooldown duration has passed they will not be able to send feedback.

```lua linenums="1" title="examples/playerFeedback.lua"
-- Put Voyager in server storage
-- Make a remote event called "SendFeedback" in replicated storage

local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

First we will make 2 new variables, the first one will be a table that stores timestamps and the second one will store a number that'll represent the cooldown duration in seconds.

```lua linenums="1" hl_lines="4 5"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

Now we will need to make a function that'll check if a player can send feedback or not. The way it will decide if someone can send a message is by subtracting the current timestamp by their timestamp. Their timestamp reprisents when they last sent feedback.

```lua linenums="1" hl_lines="7-15"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

Now all we need to do is check if the player can send feedback using the canSendFeedback function. If they can send feedback we will put them in cooldown and set their timestamp. Also we will add a PlayerRemoving function that removes the player's cooldown from the table if they leave, otherwise they will never be removed and will stay there until the server shuts down.

```lua linenums="1" hl_lines="22 23"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

game:GetService("Players").PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

And just like that we've made the exploiter's life much harder with a few lines of code. Now they cannot spam feedback anymore. Now there is only one issue, they can still just rejoin the server, while this is extremely tedious some still may attempt this. If you'd like to patch this check out Advanced remote security.

## Advanced remote security

### Join Lock Method

One way we can solve the rejoining problem is by putting the player in cooldown when they join the game. no regular player would want to send feedback the instant they join the game so this will  most likely not affect regular players.

We can do this by simply adding a PlayerAdded event and putting the player in cooldown when they join.

```lua linenums="1" hl_lines="17-19"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 10 -- 10 minutes

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
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

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

### Datastore Method

Another way to solve this by storing the timestamp in a datastore, while this is more tedious to implement it allows us to set a higher cooldown duration. This is also useful if you have a big game, since every player will now have to wait a week to send more feedback. This will greatly decrease the amount of requests sent to the proxy.

A regular datastore will be used, but this can also be done with [*ProfileService*](https://github.com/MadStudioRoblox/ProfileService) and [*Datastore2*](https://github.com/Kampfkarren/Roblox/tree/master/DataStore2).

First we will change cooldownDuration to last a week. Then we'll fetch the cooldownDatastore to use later. We will also fetch the players service since we will start using it more.

```lua linenums="1" hl_lines="5-7"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playerService = game:GetService("Players")
local cooldownDatastore = game:GetService("DataStoreService"):GetDataStore("cooldownDatastore")

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

playerService.PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

Now we'll add a PlayerAdded event, and in that event we will fetch the player's timestamp and add it to the playersOnCooldown table.

```lua linenums="1" hl_lines="19-25"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playerService = game:GetService("Players")
local cooldownDatastore = game:GetService("DataStoreService"):GetDataStore("cooldownDatastore")

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then warn("Unable to fetch player's data!") end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	playersOnCooldown[player] = nil
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

Now we'll edit the PlayerRemoving event to save the player's timestamp before removing it from the playersOnCooldown table.

```lua linenums="1" hl_lines="27-35"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playerService = game:GetService("Players")
local cooldownDatastore = game:GetService("DataStoreService"):GetDataStore("cooldownDatastore")

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then warn("Unable to fetch player's data!") end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	local success, result = pcall(function()
		cooldownDatastore:SetAsync(player.UserId, playersOnCooldown[player])
	end)
	
	if not success then warn("Data was not saved!") end
	
	playersOnCooldown[player] = nil
end)


sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```

And lasty we will add a BindToClose event to make sure data isn't lost when the server shuts down.

```lua linenums="1" hl_lines="37-45"
local voyager = game:GetService("ServerStorage").Voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")
local playersOnCooldown = {}
local cooldownDuration = 60 * 60 * 24 * 7 -- 1 week
local playerService = game:GetService("Players")
local cooldownDatastore = game:GetService("DataStoreService"):GetDataStore("cooldownDatastore")

function canSendFeedback(player : Player) : boolean
	if not playersOnCooldown[player] then return true end
	
	if os.time() - playersOnCooldown[player] > cooldownDuration then	
		return true
	else
		return false
	end
end

playerService.PlayerAdded:Connect(function(player : Player)
	local success, result = pcall(function()
		playersOnCooldown[player] = cooldownDatastore:GetAsync(player.UserId)
	end)
	
	if not success then warn("Unable to fetch player's data!") end
end)

playerService.PlayerRemoving:Connect(function(player : Player)
	local success, result = pcall(function()
		cooldownDatastore:SetAsync(player.UserId, playersOnCooldown[player])
	end)
	
	if not success then warn("Data was not saved!") end
	
	playersOnCooldown[player] = nil
end)

game:BindToClose(function()
	for _, player in playerService:GetPlayers() do
		local success, result = pcall(function()
			cooldownDatastore:SetAsync(player.UserId, playersOnCooldown[player])
		end)
		
		if not success then warn("Data was not saved!") end
	end
end)

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	if not canSendFeedback(player) then return end
	playersOnCooldown[player] = os.time()

	local embed = require(voyager.Embed).new(nil, feedback)
	
	embed:setAuthor("Feedback from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(0, 135, 255))
	embed:setTimestamp()
	embed:addField("Account Age", "**" .. player.AccountAge .. "** Days", true)
	embed:addField("Has Verified Badge?", tostring(player.HasVerifiedBadge), true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")" , true)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)
```