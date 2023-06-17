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