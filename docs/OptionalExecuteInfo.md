# <p align = "center">**OptionalExecuteInfo**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **OptionalExecuteInfo.threadId**: [string](https://create.roblox.com/docs/scripting/luau/strings)
The id of the thread the message should go to.

<br>
<hr>
<br>

## **OptionalExecuteInfo.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/strings)
Whether the message should be tts.

<br>
<hr>
<br>

## **OptionalExecuteInfo.usernameOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings)
An override for the webhook's username.

<br>
<hr>
<br>

## **OptionalExecuteInfo.avatarOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings)
An override for the webhook's avatar.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **OptionalExecuteInfo.new**(threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?, tts: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?, avatarOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [OptionalExecuteInfo](/docs/OptionalExecuteInfo.md)
This function returns a new OptionalExecuteInfo object.

*Note: If threadId is left nil the default value will be an empty string. If tts is left nil the default will be false. If usernameOverride or avatarOverride are left nil their default value will be nil.*

Parameters:

- threadId: The id of the thread the message should be sent to.
- tts: Whether the message should be tts.
- usernameOverride: An override for the webhook's username.
- avatarOverride: An override for the webhook's avatar.

<br>
<hr>
<br>