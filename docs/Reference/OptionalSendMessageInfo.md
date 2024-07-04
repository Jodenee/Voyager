# OptionalSendMessageInfo
Allows for the use of lesser used features when sending messages.

<br />

## Properties

---

<br />

### UseTTS
A [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) representing whether the message should be read aloud by text to speach when sent.

<br />

---

<br />

### UsernameOverride 
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing an override for the webhook's username.

<br />

---

<br />

### AvatarOverride
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing an image url that'll override the webhook's avatar.

<br />

---

<br />

### MessageFlags 
A [*MessageFlags*](MessageFlags.md) instance representing the flags the message will have when sent.

<br />

---

<br />

### ThreadName
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the name of the thread that will be created.

???+ info
    The webhook's channel **must** be a forum channel for this to have an effect!

<br />

---

<br />

## Constructors

---

<br />

### new(tts, usernameOverride, avatarOverride, messageFlags, threadName)
This method returns a new [*OptionalSendMessageInfo*](OptionalSendMessageInfo.md) instance.

???+ info "Default Parameter Values"
    useTTS: `false`

    messageFlags: `MessageFlags.new(0)`

***Parameters***

- useTTS : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - An optional boolean representing whether the message should be text to speach when sent.
- usernameOverride : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - An override for the webhook's username.
- avatarOverride : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - An override for the webhook's avatar.
- messageFlags : [*MessageFlags?*](MessageFlags.md) - A MessageFlags object.
- threadName : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - Name of the thread to create.

<br />

---

<br />