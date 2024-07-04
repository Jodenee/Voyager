# Message
Represents a message.

<br />

## Properties

---

<br />

### Id
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the message's id.

<br />

---

<br />

### MessageType
A [*number*](https://create.roblox.com/docs/scripting/luau/numbers) representing the message's [*type*](https://discord.com/developers/docs/resources/channel#message-object-message-types).

<br />

---

<br />

### Content
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the message's content.

<br />

---

<br />

### ChannelId
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the id of the channel the message was sent in.

<br />

---

<br />

### Author
An instance of [*User*](User.md) representing the author of the message.

<br />

---

<br />

### Embeds
A table of [*Embed*](Embed.md) instances that represent the embeds attached to the message.

<br />

---

<br />

### MentionedUsers
A table of [*User*](User.md) instances that represent users mentioned in the message.

<br />

---

<br />

### MentionedRoles
A table of [*strings*](https://create.roblox.com/docs/scripting/luau/strings) that contain role ids which were mentioned in the message.

<br />

---

<br />

### IsPinned
A [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that represents whether the message is pinned.

<br />

---

<br />

### MentionsEveryone
A [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that represents whether the message mentions @everyone.

<br />

---

<br />

### IsTTS
A [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that represents whether the message was a TTS message. 

<br />

---

<br />

### CreatedAt
A [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime) instance representing when the message was created.

<br />

---

<br />

### EditedAt
An optional [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime) instance representing when the message was last edited.

<br />

---

<br />

### Flags
A [*MessageFlags*](MessageFlags.md) instance representing the message's flags.

<br />

---

<br />

### WebhookId
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the id of the webhook that sent the message.

<br />

---

<br />

### JumpUrl
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the jump url of the message.

<br />

---

<br />

### Position
A optional [*number*](https://create.roblox.com/docs/scripting/luau/numbers) containing the approximate position of the message in the thread.

<br />

---

<br />

## Constructors

---

<br />

### new(data)
This method returns a new [*Message*](Message.md) instance.

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- data : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*message object*](https://discord.com/developers/docs/resources/channel#message-object) returned by Discord.

<br />

---

<br />