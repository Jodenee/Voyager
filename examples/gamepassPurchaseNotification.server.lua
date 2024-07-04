-- Put Voyager in server storage

local marketplaceService = game:GetService("MarketplaceService")
local voyager = game:GetService("ServerStorage").Voyager
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

marketplaceService.PromptGamePassPurchaseFinished:Connect(function(player : Player, gamepassid : number, wasPurchased : boolean)
	if not wasPurchased then return end

	local gamepassInfo = marketplaceService:GetProductInfo(gamepassid, Enum.InfoType.GamePass)
	local embed = require(voyager.Embed).new()
		:SetColor(Color3.fromRGB(85, 255, 127))
		:SetTimestamp()
		:SetAuthor(
			player.DisplayName .. " has purchased " .. gamepassInfo.Name,
			"https://www.roblox.com/users/" .. player.UserId .. "/profile"
		)
		:AddField(
			"Gamepass Price",
			"**" .. gamepassInfo.PriceInRobux .. "** Robux"
		)
		:AddField(
			"Earnings (70%)",
			"**" .. (gamepassInfo.PriceInRobux * .7) .. "** Robux"
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