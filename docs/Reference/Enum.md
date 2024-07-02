# Enum
Discord enumerations.

<br />

### PublicUserFlag

A [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) of public user flags. [*Offical docs reference*](https://discord.com/developers/docs/resources/user#user-object-user-flags)

| Enum                    | Type                                                    | Description                                         |
|:-----------------------:|:-------------------------------------------------------:|-----------------------------------------------------|
| Staff                   | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is an offical Discord staff member.        |
| Partner                 | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a partnered server owner.               |
| Hypesquad               | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a hypesquad events member.              |
| BugHunterLevelOne       | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a level 1 bug hunter.                   |
| BugHunterLevelTwo       | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a level 2 bug hunter.                   |
| HouseOfBraveryMember    | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a house of bravery member.              |
| HouseOfBrillianceMember | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a house of brilliance member.           |
| HouseOfBalanceMember    | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a house of balance member.              |
| PremiumEarlySupporter   | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is an early nitro supporter.               |
| VerifiedBot             | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is a verified bot.                         |
| VerifiedDeveloper       | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is an early verified bot developer.        |
| CertifiedModerator      | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is apart of the Discord moderator program. |
| ActiveDeveloper         | [*number*](https://create.roblox.com/docs/luau/numbers) | The user is an active bot developer.                |

<br />

---

<br />

### MessageFlag

A [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) of message flags. [*Offical docs reference*](https://discord.com/developers/docs/resources/channel#message-object-message-flags)

| Enum                    | Type                                                    | Description                                                |
|:-----------------------:|:-------------------------------------------------------:|------------------------------------------------------------|
| SuppressEmbeds          | [*number*](https://create.roblox.com/docs/luau/numbers) | Suppresses all embeds on a message.                        |
| SuppressNotifications   | [*number*](https://create.roblox.com/docs/luau/numbers) | Suppresses the notification sound for all users mentioned. |

<br />

---

<br />

### ImageFormat

A [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) of strings that represent different image extensions. [*Offical docs reference*](https://discord.com/developers/docs/reference#image-formatting-image-formats)

| Enum     | Type                                                    | Description              |
|:--------:|:-------------------------------------------------------:|--------------------------|
| Jpeg     | [*string*](https://create.roblox.com/docs/luau/strings) | Represents a .jpeg file. |
| Png      | [*string*](https://create.roblox.com/docs/luau/strings) | Represents a .png file.  |
| Gif      | [*string*](https://create.roblox.com/docs/luau/strings) | Represents a .gif file.  |
| WebP     | [*string*](https://create.roblox.com/docs/luau/strings) | Represents a .webp file. |
| Lottie   | [*string*](https://create.roblox.com/docs/luau/strings) | Represents a .json file. |

<br />

---

<br />

### RatelimitScope

A [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) of strings that contain scopes you can be ratelimited from. [*Offical docs reference*](https://discord.com/developers/docs/topics/rate-limits#exceeding-a-rate-limit-example-exceeded-user-rate-limit-response)

| Enum     | Type                                                    | Description                         |
|:--------:|:-------------------------------------------------------:|-------------------------------------|
| User     | [*string*](https://create.roblox.com/docs/luau/strings) | You have been directly ratelimited. |
| Shared   | [*string*](https://create.roblox.com/docs/luau/strings) | The resource is being rate limited. |
| Global   | [*string*](https://create.roblox.com/docs/luau/strings) | You have been directly ratelimited. |

<br />

---

<br />