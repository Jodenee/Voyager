# BaseFlags

<br />

## Properties

<br />

### **BaseFlags.value :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br />

---

<br />

## Methods

<br />

### **BaseFlags.fromBitfield**(value **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*BaseFlags*](BaseFlags.md)
This method returns a new BaseFlags object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***value:*** Default bitfield.

<br />

---

<br />

### **BaseFlags:hasFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)) **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains the passed flag.

***Parameters***

- ***flag:*** The flag that'll be looked for.

<br />

---

<br />

### **BaseFlags:setFlag**(flag **:** [*number*](https://create.roblox.com/docs/scripting/luau/numbers), toggle **:** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggle a flag in the bitfield either to true or false.

***Parameters***

- ***flag:*** A flag.
- ***toggle:*** If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br />

---

<br />