# Migrating to v3.0

Updating Voyager from v2 to v3 will bring breaking changes. This is here to help you see what changes to make in your codebase if you wish to upgrade.

### Small Changes
---

* Removed class `Reaction`. Has no replacement.
* Removed class `Emoji`. Has no replacement.
* Removed class `ThreadMessage`. Replaced by `Message` class.
* Removed class `EditedMessage`. Replaced by `Message` class.
* Removed class `EditedThreadMessage`. Replaced by `Message` class.
* Removed class `Author`. Replaced by `User` class.

### Webhook changes
---

* Renamed property `id` to `Id`.
* Renamed property `token` to `Token`.
* Renamed property `baseUrl` to `BaseUrl`.
* Removed property `ratelimitInfo`. Replaced by `RequestStatus.RatelimitInformation`.
* Changed method `execute`.
    * Renamed to `SendMessage`.
    * No longer returns a third item. Moved to `RequestStatus.RatelimitInformation`.
* Changed method `editMessage`.
    * Renamed to `EditMessage`.
    * No longer returns a third item. Moved to `RequestStatus.RatelimitInformation`.
* Changed method `deleteMessage`.
    * Renamed to `DeleteMessage`.
    * No longer returns a third item. Moved to `RequestStatus.RatelimitInformation`.
* Renamed method `_validateExecuteRequest` to `_ValidateSendMessageRequest`.
* Renamed method `_validateEditMessageRequest` to `_ValidateEditMessageRequest`.
* Renamed method `_request` to `_Request`.

### RequestStatus changes
---

* Renamed key `success` to `Success`
* Renamed key `statusCode` to `StatusCode`
* Renamed key `statusMessage` to `StatusMessage`
* Removed key `message`. Replaced by `RequestStatus.ProxyInformation.Message`.
* Removed key `reason`. Replaced by `RequestStatus.ProxyInformation.Reason`.

### RatelimitInformation changes
---

* Renamed key `limit` to `Limit`.
* Renamed key `remaining` to `Remaining`.
* Renamed key `reset` to `Reset`.
* Renamed key `resetAfter` to `ResetAfter`.
* Renamed key `resetAfterSafe` to `ResetAfterSafe`.
* Renamed key `bucket` to `Bucket`.

### RatelimitedInformation changes
---

* Renamed key `scope` to `Scope`.
* Renamed key `retryAfter` to `RetryAfter`.
* Renamed key `retryAfterSafe` to `RetryAfterSafe`.

### OptionalExecuteInfo changes
---

* Renamed to `OptionalSendMessageInfo`.
* Renamed property `tts` to `UseTTS`.
* Renamed property `usernameOverride` to `UsernameOverride`.
* Renamed property `avatarOverride` to `AvatarOverride`.
* Renamed property `messageFlags` to `Flags`.
* Renamed property `threadName` to `ThreadName`.

<br/>

* Removed property `threadId`. Use the new dedicated methods for threads: `SendMessageInThread`, `EditMessageInThread` and `DeleteMessageInThread`.

<br/>

* Changed constructor method `new`.
    * Removed `threadId` parameter. Any method that requires a threadId should now be passed to that method directly.
    * Property `UseTTS` is now nil by defualt
    * Property `Flags` is now nil by defualt

### Embed changes
---

* Renamed property `title` to `Title`.
* Renamed property `description` to `Description`.
* Renamed property `url` to `Url`.
* Renamed method `setTitle` to `SetTitle`
* Renamed method `setDescription` to `SetDescription`
* Renamed method `setUrl` to `SetUrl`
* Renamed method `setTimestamp` to `SetTimestamp`
* Renamed method `setColor` to `SetColor`
* Renamed method `setFooter` to `SetFooter`
* Renamed method `setImage` to `SetImage`
* Renamed method `setThumbnail` to `SetThumbnail`
* Renamed method `setAuthor` to `SetAuthor`
* Renamed method `addField` to `AddField`
* Renamed method `totalCharacters` to `TotalCharacters`
* Renamed method `_validate` to `_Validate`
* Removed method `colorToRGB`. Replaced by `Embed.Color`

<br/>

* Changed property `timestamp`
    * Renamed to `Timestamp`
    * Now returns a `Datetime` instance instead of a string.
* Changed property `color`
    * Renamed to `Color`
    * Now returns a `Color3` instance instead of a number.
* Changed property `footer`
    * Renamed to `Footer`
    * Now returns a `EmbedFooter` instance instead of a raw object.
* Changed property `image`
    * Renamed to `Image`
    * Now returns a `EmbedImage` instance instead of a raw object.
* Changed property `thumbnail`
    * Renamed to `Thumbnail`
    * Now returns a `EmbedThumbnail` instance instead of a raw object.
* Changed property `author`
    * Renamed to `Author`
    * Now returns a `EmbedAuthor` instance instead of a raw object.
* Changed property `fields`
    * Renamed to `Fields`
    * Now returns a table of `EmbedField` instances instead of a table of raw objects.


### Message changes
---

* Added property `EditedAt`, replaces `EditedMessage.editedAt`.
* Added property `Position`, replaces `ThreadMessage.position`.
* Renamed property `id` to `Id`.
* Renamed property `messageType` to `MessageType`.
* Renamed property `content` to `Content`.
* Renamed property `channelId` to `ChannelId`.
* Renamed property `embeds` to `Embeds`.
* Renamed property `mentions` to `MentionedUsers`.
* Renamed property `mentionRoles` to `MentionedRoles`.
* Renamed property `pinned` to `IsPinned`.
* Renamed property `mentionEveryone` to `MentionsEveryone`.
* Renamed property `tts` to `IsTTS`.
* Renamed property `createdAt` to `CreatedAt`.
* Renamed property `flags` to `Flags`.
* Renamed property `webhookId` to `WebhookId`.
* Renamed property `jumpUrl` to `JumpUrl`.
* Removed property `timestamp`.

* Changed property `author`
    * Renamed to `Author`.
    * Now returns a `User` instance.

### Enum changes
---

* Moved Enum module to the root folder of the project.
* Enum module is now fully typed.

<br/>

* Renamed enum group `UserPublicFlags` to `UserPublicFlag`
* Renamed enum `PARTNER` to `Partner `
* Renamed enum `HYPESQUAD` to `Hypesquad `
* Renamed enum `BUG_HUNTER_LEVEL_1` to `BugHunterLevelOne`
* Renamed enum `BUG_HUNTER_LEVEL_2 ` to `BugHunterLevelTwo`
* Renamed enum `HYPESQUAD_ONLINE_HOUSE_1 ` to `HouseOfBraveryMember`
* Renamed enum `HYPESQUAD_ONLINE_HOUSE_2` to `HouseOfBrillianceMember`
* Renamed enum `HYPESQUAD_ONLINE_HOUSE_3` to `HouseOfBalanceMember`
* Renamed enum `PREMIUM_EARLY_SUPPORTER` to `PremiumEarlySupporter`
* Renamed enum `VERIFIED_BOT ` to `VerifiedBot`
* Renamed enum `VERIFIED_DEVELOPER` to `VerifiedDeveloper`
* Renamed enum `CERTIFIED_MODERATOR` to `CertifiedModerator`
* Renamed enum `ACTIVE_DEVELOPER` to `ActiveDeveloper`
* Removed enum `TEAM_PSEUDO_USER `. Has no replacement.
* Removed enum `BOT_HTTP_INTERACTIONS`. Has no replacement.

<br/>

* Renamed enum group `MessageFlags` to `MessageFlag`
* Renamed enum `SUPPRESS_EMBEDS` to `SuppressEmbeds`
* Renamed enum `SUPPRESS_NOTIFICATIONS` to `SuppressNotifications`

<br/>

* Renamed enum group `AvatarImageFormats` to `ImageFormat`
* Renamed enum `JPEG` to `Jpeg`
* Renamed enum `PNG` to `Png`
* Renamed enum `WEBP` to `WebP`
* Renamed enum `GIF` to `Gif`

<br/>

* Renamed enum group `RatelimitScopes` to `RatelimitScope`
* Renamed enum `USER` to `User`
* Renamed enum `SHARED` to `Shared`
* Renamed enum `GLOBAL` to `Global`

### User changes
---

* Renamed property `id` to `Id`
* Renamed property `username` to `Username`
* Renamed property `avatar` to `AvatarHash`
* Renamed property `bot` to `IsBot`
* Renamed property `mention` to `Mention`
* Renamed property `globalName` to `GlobalName`
* Renamed property `publicFlags` to `PublicFlags`
* Renamed method `getAvatarUrl` to `GetAvatarUrl`
* Renamed method `hasAnimatedAvatar` to `HasAnimatedAvatar`

### DateFormatter changes
---

* Renamed method `relativeTime` to `RelativeTime`
* Renamed method `longDate` to `LongDate`
* Renamed method `shortDate` to `ShortDate`
* Renamed method `longTime` to `LongTime`
* Renamed method `shortTime` to `ShortTime`
* Renamed method `longDateTime` to `LongDateTime`
* Renamed method `shortDateTime` to `ShortDateTime`

### EmojiFormatter changes
---

* Renamed method `emoji` to `Emoji`
* Renamed method `customEmoji` to `CustomEmoji`
* Renamed method `animatedEmoji` to `AnimatedEmoji`

### MentionFormatter changes
---

* Renamed method `mentionUser` to `MentionUser`
* Renamed method `mentionRole` to `MentionRole`
* Renamed method `mentionChannel` to `MentionChannel`

### MessageFlags changes
---

* Renamed property `value` to `Value`
* Renamed method `getFlags` to `GetFlags`
* Renamed method `hasFlag` to `HasFlag`
* Renamed method `setFlag` to `SetFlag`

### PublicUserFlags changes
---

* Renamed property `value` to `Value`
* Renamed method `getFlags` to `GetFlags`
* Renamed method `hasFlag` to `HasFlag`
* Renamed method `setFlag` to `SetFlag`