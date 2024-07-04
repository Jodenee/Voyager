-- Put Voyager in server storage

local voyager = game:GetService("ServerStorage").Voyager
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

local _, requestStatus = webhook:SendMessage("Hello, world!", nil, false, true)

if requestStatus.Success then
	-- In this case ratelimitInfo would be of type RatelimitInformation
elseif requestStatus.StatusCode == 429 then
	-- In this case ratelimitInfo would be of type RatelimitedInformation
end