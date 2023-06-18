# MessageFlags

<br />

## Properties

<br />

### **MessageFlags.value :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br />

---

<br />

## Methods

<br />

### **MessageFlags.fromBitfield**(value **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*MessageFlags*](MessageFlags.md)
This method returns a new MessageFlags object.

Parameters:

- ***value:*** Default bitfield.

<br />

---

<br />

### **MessageFlags.fromFlags**(flags **:** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)}) **:** [*MessageFlags*](MessageFlags.md)
This method returns a new MessageFlags object from a table of flags.

??? tip
    You can use Enum.MessageFlags to fill out the flags parameter.

***Parameters***

- ***flags:*** A table of message flags.

<br />

---

<br />

### **MessageFlags:hasFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains a specific flag.

??? tip
    You can use Enum.MessageFlags to fill out the flag parameter.

***Parameters***

- ***flag:*** The flag that'll be looked for.

<br />

---

<br />

### **MessageFlags:setFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers), toggle **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)): [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggle a flag in the bitfield either to true or false.

??? tip
    You can use Enum.MessageFlags to fill out the flag parameter.

***Parameters***

- ***flag:*** A flag.
- ***toggle:*** If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br />

---

<br />