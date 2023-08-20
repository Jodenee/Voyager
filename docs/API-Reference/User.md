# User

<br />

## Properties

<br />

### **User.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The user's Discord id.

<br />

---

<br />

### **User.username :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The user's Discord username.

<br />

---

<br />

### **User.avatar :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The user's Discord avatar hash.

<br />

---

<br />

### **User.bot :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the user is a bot.

<br />

---

<br />

### **User.globalName :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
the user's display name on Discord.

<br />

---

<br />

### **User.publicFlags :** [*PublicUserFlags*](PublicUserFlags.md)
The user's flags.

<br />

---

<br />

## Methods

<br />

### **User.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [*User*](User.md)
This method returns a new User object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** A [*user object*](https://discord.com/developers/docs/resources/user#user-object).

<br />

---

<br />

### **User:getAvatarUrl**(size **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), imageFormat **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
This method will return the user's avatar url.

???+ warning
    The size parameter can only be a power of two between 16 and 4096.

???+ info
    If the imageFormat paramiter is left out. It will defualt to .png.

??? tip
    Use [*Enum.AvatarImageFormats*](Enum.md) to fill in the imageFormat parameter.

***Parameters***

- ***size:*** The desired size the avatar should be.
- ***imageFormat:*** The format the author's avatar should be returned as.

<br />

---

<br />

### **User:hasAnimatedAvatar**(): [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
This method checks whether the user has an animated avatar.

<br />

---

<br />