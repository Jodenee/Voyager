# With vs without Voyager

??? danger "Security Disclaimer"
	Both examples shown here are not safe to use in a live game, for the sake of simplicity these scripts are not secured. If you wish to use them in your game you need to follow the [*remote secruity*](./Tutorials/securing-remotes.md) tutorial.

## Goal

Make a script that sends a message with embedded content that displays the player's feedback to Discord.

## With Voyager

```lua linenums="1" title="examples/playerFeedback.server.lua"
--8<-- "examples/playerFeedback.server.lua"
```

## Without Voyager

```lua linenums="1"
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local httpService = game:GetService("HttpService")

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local requestBody = {
		["embeds"] = {
			{
				["description"] = feedback,
				["author"] = {
					["name"] = "Feedback from " .. player.DisplayName,
					["url"] = "https://www.roblox.com/users/" .. player.UserId .. "/profile"
				},
				["color"] = 34815,
				["timestamp"] = DateTime.now():ToIsoDate(),
				["fields"] = {
					{
						["name"] = "Account Age",
						["value"] = "**" .. player.AccountAge .. "** Days"
					},
					{
						["name"] = "Has Verified Badge?",
						["value"] = tostring(player.HasVerifiedBadge)
					},
					{
						["name"] = "From Game",
						["value"] = "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
					}
				}
			}
		}
	}
	
	local responce = httpService:RequestAsync({
		Url = "https://webhook.lewisakura.moe/api/webhooks/webhookId/webhookToken/queue",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then
		warn("Request was not successful! " .. responce.StatusCode .. " " .. responce.StatusMessage)
	end
end)
```

## Conclusion

As you can see, the example using Voyager is around 10 lines of code shorter, the code looks much better and way more readable than the example not using Voyager.