-- Put Voyager in server storage
-- Make a remote event called "SendReport" in replicated storage

local voyager = game:GetService("ServerStorage").Voyager
local sendReportRemote = game:GetService("ReplicatedStorage").SendReport
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

sendReportRemote.OnServerEvent:Connect(function(player : Player, reportedPlayer : Player, report : string, reason : string)
	local embed = require(voyager.Embed).new(nil, report)
	
	embed:setAuthor("Report from " .. player.DisplayName, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(255, 0, 0))
	embed:setTimestamp()
	embed:addField("Reported Player", "[Profile Link](https://www.roblox.com/users/" .. reportedPlayer.UserId .. "/profile)", true)
	embed:addField("Reason", reason, true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:setFooter("Job Id: " .. game.JobId)
	
	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)