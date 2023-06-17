-- Put Voyager in server storage

local marketplaceService = game:GetService("MarketplaceService")
local voyager = game:GetService("ServerStorage").Voyager
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

marketplaceService.PromptGamePassPurchaseFinished:Connect(function(player : Player, gamepassid : number, wasPurchased : boolean)
	if not wasPurchased then return end
	local gamepassInfo = marketplaceService:GetProductInfo(gamepassid, Enum.InfoType.GamePass)
	local embed = require(voyager.Embed).new()
	
	embed:setAuthor(player.DisplayName .. " has purchased " .. gamepassInfo.Name, "https://www.roblox.com/users/" .. player.UserId .. "/profile")
	embed:setColor(Color3.fromRGB(85, 255, 127))
	embed:addField("Gamepass Price", "**" .. gamepassInfo.PriceInRobux .. "** Robux", true)
	embed:addField("Earnings (70%)", "**" .. ((70/100) * gamepassInfo.PriceInRobux) .. "** Robux", true)
	embed:addField("From Game", "[Game Link](https://www.roblox.com/games/" .. game.PlaceId .. ")", true)
	embed:setTimestamp()

	local _, requestStatus = webhook:execute(nil, {embed})
	
	if not requestStatus.success then
		warn("Request was not successful! " .. requestStatus.statusCode .. " " .. requestStatus.statusMessage)
	end
end)