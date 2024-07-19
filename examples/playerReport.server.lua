local sendReportRemote = game:GetService("ReplicatedStorage").SendReport
local voyager = require(game:GetService("ServerStorage").voyager)
local webhook = voyager.Webhook.new("webhookId", "webhookToken")

sendReportRemote.OnServerEvent:Connect(function(player : Player, reportedPlayer : Player, report : string, reason : string)
	local embed = require(voyager.Embed).new()
		:SetDescription(report)
		:SetColor(Color3.fromRGB(255, 0, 0))
		:SetTimestamp()
		:SetFooter("Job Id: " .. game.JobId)
		:SetAuthor(
			"Report from " .. player.DisplayName,
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
		:AddField(
			"Reported Player",
			"[Profile Link](https://www.roblox.com/users/" .. reportedPlayer.UserId .. "/profile)"
		)
		:AddField(
			"Reason",
			reason
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