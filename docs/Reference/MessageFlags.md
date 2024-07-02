# MessageFlags
Represents a message's flags.

<br />

## Properties

---

<br />

### Value
A [*number*](https://create.roblox.com/docs/scripting/luau/numbers) containing flags combined as a bitfield.

<br />

---

<br />

## Constructors

---

<br />

### FromBitfield(value)
Constructs a new [*MessageFlags*](MessageFlags.md) instance from a bitfield. Returns a new [*MessageFlags*](MessageFlags.md) instance.

***Parameters***

- value : [*number*](https://create.roblox.com/docs/scripting/luau/numbers) - A bitfield.

<br />

---

<br />

### FromFlags(flags) 
Constructs a new [*MessageFlags*](MessageFlags.md) instance from a table of flags. Returns a new [*MessageFlags*](MessageFlags.md) instance.

??? tip
    You can use the [*MessageFlag*](Enum.md#messageflag) enum to fill out the flags parameter.

***Parameters***

- flags : { [*number*](https://create.roblox.com/docs/scripting/luau/numbers) } - A table of numbers that represent message flags.

<br />

---

<br />

## Methods

---

<br />

### HasFlag(flag)
Returns a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that represents whether the bitfield contains the flag.

***Parameters***

- flag : [*number*](https://create.roblox.com/docs/scripting/luau/numbers) - The flag that'll be looked for.

<br />

---

<br />

### SetFlag(flag, toggle)
This method will toggle a flag in the bitfield either to true or false. Returns [*nil*](https://create.roblox.com/docs/luau/nil).

***Parameters***

- flag : [*number*](https://create.roblox.com/docs/scripting/luau/numbers) - A flag.
- toggle : [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether to add or remove the flag from the bitfield.

<br />

---

<br />

### GetFlags()
Returns a table of [*numbers*](https://create.roblox.com/docs/scripting/luau/numbers) that represent flags found in the bitfield.

<br />

---

<br />