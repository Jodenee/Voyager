-- Put Voyager in server storage

local voyager = game:GetService("ServerStorage").Voyager
local webhook = require(voyager.Webhook).new("webhookId", "webhookToken")

local _, queuedRequestStatus, _ = webhook:execute("Hello, world!") -- Since this request gets queued, ratelimitInfo will be an empty dictionary
local _, requestStatus, ratelimitInfo = webhook:execute("Hello, world!", nil, false, true)

if requestStatus.success then
	-- In this case ratelimitInfo would be of type RatelimitInformation
elseif requestStatus.statusCode == 429 then
	-- In this case ratelimitInfo would be of type RatelimitedInformation
end