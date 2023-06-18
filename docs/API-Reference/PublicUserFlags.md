# PublicUserFlags

<br />

## Properties

<br />

### **PublicUserFlags.value :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br />

---

<br />

## Methods

<br />

### **PublicUserFlags.fromBitfield**(value **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*PublicUserFlags*](PublicUserFlags.md)
This method returns a new [*PublicUserFlags*](PublicUserFlags.md) object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***value:*** A bitfield.

<br />

---

<br />

### **PublicUserFlags:hasFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains a specific flag.

??? tip
    You can use Enum.UserPublicFlags to fill out the flag parameter.

***Parameters***

- flag: The flag that'll be looked for.

<br />

---

<br />

### **PublicUserFlags:setFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers), toggle **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggle a flag in the bitfield either to true or false.

??? tip
    You can use Enum.UserPublicFlags to fill out the flag parameter.

***Parameters***

- ***flag:*** A flag.
- ***toggle:*** If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br />

---

<br />

### **PublicUserFlags:getFlags**() **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)}
This method will return a table of flags that are in the bitfield.

<br />

---

<br />