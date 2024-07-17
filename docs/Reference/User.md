# User
Represents a user

<br />

## Properties

---

<br />

### Id 
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the user's Id.

<br />

---

<br />

### Username
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the user's username.

<br />

---

<br />

### AvatarHash
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the user's avatar hash.

<br />

---

<br />

### IsBot 
A [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) representing whether the user is a bot.

<br />

---

<br />

### Mention
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that mentions this user.

<br />

---

<br />

### GlobalName 
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the user's display name.

<br />

---

<br />

### PublicFlags 
A [*PublicUserFlags*](PublicUserFlags.md) instance representing the user's flags.

<br />

---

<br />

## Constructors

---

<br />


### new(data)
Constructs a new [*User*](User.md) instance from a [*user object*](https://discord.com/developers/docs/resources/user#user-object). Returns a new [*User*](User.md) instance.

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- data : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*user object*](https://discord.com/developers/docs/resources/user#user-object) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### GetAvatarUrl(size, imageFormat)
Returns an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) containing the user's avatar url.

???+ warning
    The size parameter can only be a **power of two** between **16** and **4096**.

    If the user has no avatar, this **will** return [*nil*](https://create.roblox.com/docs/luau/nil).

???+ info "Default Parameter Values"
    imageFormat: `.png`

??? tip
    Use the [*ImageFormat*](Enum.md#imageformat) enum to fill in the imageFormat parameter.

***Parameters***

- size : [*number?*](https://create.roblox.com/docs/scripting/luau/numbers) - The desired size of the user's avatar url.
- imageFormat : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The desired image format of the user's avatar url.

<br />

---

<br />

### HasAnimatedAvatar()
Returns a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) representing whether the user's avatar is animated.

<br />

---

<br />