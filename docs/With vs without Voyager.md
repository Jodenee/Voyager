# With vs without Voyager

## Goal

Make a script that sends a Discord message with embedded content that displays the player's feedback.

### With Voyager

```lua linenums="1" title="examples\playerFeedback.lua"
--8<-- "examples\playerFeedback.lua"
```

### Without Voyager

```lua linenums="1"
-- Make a remote event called "SendFeedback" in replicated storage

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
				["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S." .. math.round(tick() % 1 * 1000) .. "Z"),
				["fields"] = {
					{
						["name"] = "Account Age",
						["value"] = "**" .. player.AccountAge .. "** Days",
						["inline"] = true
					},
					{
						["name"] = "Has Verified Badge?",
						["value"] = tostring(player.HasVerifiedBadge),
						["inline"] = true
					},
					{
						["name"] = "From Game",
						["value"] = "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")",
						["inline"] = true
					}
				}
			}
		}
	}
	
	local responce = httpService:RequestAsync({
		Url = "https://webhook.lewisakura.moe/api/webhooks/webhookId/webhookToken",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = httpService:JSONEncode(requestBody)
	})
	
	if not responce.Success then
		warn("Request was not successful! " .. responce.StatusCode .. " " .. responce.StatusMessage)
	end
end)
```