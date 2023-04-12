# <p align = "center">**BaseFlags**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## BaseFlags.value: [number](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **BaseFlags.fromBitfield**(value: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [BaseFlags](docs/bases/BaseFlags.md)
This method returns a new BaseFlags object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:

- value: Default bitfield.

<br>
<hr>
<br>

## **BaseFlags:hasFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains the passed flag.

Parameters:

- flag: The flag that'll be looked for.

<br>
<hr>
<br>

## **BaseFlags:setFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers), toggal: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)): [nil](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggal a flag in the bitfield either to true or false.

Parameters:

- flag: The flag that'll be toggled.
- toggal: If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br>
<hr>
<br>