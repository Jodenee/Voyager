local voyager = game:GetService("ServerStorage").voyager
local sendFeedbackRemote = game:GetService("ReplicatedStorage").SendFeedback
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

sendFeedbackRemote.OnServerEvent:Connect(function(player : Player, feedback : string)
	local embed = require(voyager.Embed).new()
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