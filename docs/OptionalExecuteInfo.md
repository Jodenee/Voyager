# <p align = "center">**OptionalExecuteInfo**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## **OptionalExecuteInfo.threadId**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)
The id of the thread the message should go to.

<br>
<hr>
<br>

## **OptionalExecuteInfo.tts**: [boolean](https://create.roblox.com/docs/scripting/luau/strings)
Whether the message should be tts.

<br>
<hr>
<br>

## **OptionalExecuteInfo.usernameOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)
An override for the webhook's username.

<br>
<hr>
<br>

## **OptionalExecuteInfo.avatarOverride**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)
An override for the webhook's avatar.

<br>
<hr>
<br>

## **OptionalExecuteInfo.messageFlags**: [MessageFlags](docs/MessageFlags.md)
A MessageFlags object.

<br>
<hr>
<br>

## **OptionalExecuteInfo.threadName**: [string](https://create.roblox.com/docs/scripting/luau/strings) | [nil](https://create.roblox.com/docs/scripting/luau/nil)
Name of the thread to create. (requires the webhook channel to be a forum channel)

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **OptionalExecuteInfo.new**(threadId: [string](https://create.roblox.com/docs/scripting/luau/strings)?, tts: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)?, usernameOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?, avatarOverride: [string](https://create.roblox.com/docs/scripting/luau/strings)?, messageFlags: [MessageFlags](docs/MessageFlags.md)?, threadName: [string](https://create.roblox.com/docs/scripting/luau/strings)?): [OptionalExecuteInfo](/docs/OptionalExecuteInfo.md)
This function returns a new OptionalExecuteInfo object.

*Note: If tts is left nil the default will be false.*

*Note: If messageFlags is left nil the default value will be a MessageFlags object with value 0.*

Parameters:

- threadId: The id of the thread the message should be sent to.
- tts: Whether the message should be tts.
- usernameOverride: An override for the webhook's username.
- avatarOverride: An override for the webhook's avatar.
- messageFlags: A MessageFlags object.
- threadName: Name of the thread to create. (requires the webhook's channel to be a forum channel)

<br>
<hr>
<br>