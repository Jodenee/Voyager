# <p align = "center">**MessageFlags**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## MessageFlags.value: [number](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **MessageFlags.fromBitfield**(value: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [MessageFlags](docs/MessageFlags.md)
This method returns a new MessageFlags object.

Parameters:

- value: Default bitfield.

<br>
<hr>
<br>

## **MessageFlags.fromFlags**(flags: {[number](https://create.roblox.com/docs/scripting/luau/numbers)}): [MessageFlags](docs/MessageFlags.md)
This method returns a new MessageFlags object.

Parameters:

- flags: A table of message flags that'll be combined into a bitfield.

<br>
<hr>
<br>

## **MessageFlags:hasFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains a specific flag.

Parameters:

- flag: The flag that'll be looked for.

<br>
<hr>
<br>

## **MessageFlags:setFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers), toggle: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)): [nil](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggle a flag in the bitfield either to true or false.

Parameters:

- flag: The flag that'll be toggled.
- toggle: If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br>
<hr>
<br>
