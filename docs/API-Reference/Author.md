# Author

<br />

## Properties

<br />

### **Author.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The author's Discord id.

<br />

---

<br />

### **Author.username :**  [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The author's Discord username.

<br />

---

<br />

### **Author.avatar :**  [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The author's Discord avatar hash.

<br />

---

<br />

### **Author.bot :**  [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the author is a bot.

<br />

---

<br />

## Methods

<br />

### **Author.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [*Author*](Author.md)
This method returns a new Author object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** An [*author object*](https://Discord.com/developers/docs/resources/user#user-object).

<br />

---

<br />

### **Author:getAvatarUrl**(size **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), imageFormat **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
This method will return the author's avatar url.

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

### **Author:hasAnimatedAvatar**() **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
This method checks whether the author has an animated avatar.

<br />

---

<br />