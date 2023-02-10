# <p align = "center">**OptionalExecuteInfo**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## <p align = "left">**OptionalExecuteInfo.threadId**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">The id of the thread the message should go to.</p>
---
<br>

## <p align = "left">**OptionalExecuteInfo.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">Whether the message should be tts.</p>
---
<br>

## <p align = "left">**OptionalExecuteInfo.usernameOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">An override for the webhook's username.</p>
---
<br>

## <p align = "left">**OptionalExecuteInfo.avatarOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings)</p>
### <p align = "left">An override for the webhook's avatar.</p>
---

<br>
<br>

# <p align = "center">*Methods*</p>

<br>
<br>

## <p align = "left">**OptionalExecuteInfo.new**(threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?, tts: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?, avatarOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [OptionalExecuteInfo](/docs/OptionalExecuteInfo.md)</p>
### <p align = "left">This function returns a new OptionalExecuteInfo object.</p>

*<p align = "left">Note: If threadId is left nil the default value will be an empty string. If tts is left nil the default will be false. If usernameOverride or avatarOverride are left nil their default value will be nil.</p>*

### <p align = "left">Parameters:<p>

- threadId: The id of the thread the message should be sent to.
- tts: Whether the message should be tts.
- usernameOverride: An override for the webhook's username.
- avatarOverride: An override for the webhook's avatar.
---