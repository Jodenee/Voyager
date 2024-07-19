local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = voyager.Embed.new()
		:SetDescription(feedback)
		:SetColor(Color3.fromRGB(0, 135, 255))
		:SetTimestamp()
		:SetAuthor(
			"Feedback from " .. player.DisplayName, 
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
		:addField(
			"Account Age",
			"**" .. player.AccountAge .. "** Days"
		)
		:addField(
			"Has Verified Badge?",
			tostring(player.HasVerifiedBadge)
		)
		:addField(
			"From Game",
			"[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")"
		)

	local _, requestStatus = webhook:SendMessage(nil, { embed })

	if not requestStatus.Success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)