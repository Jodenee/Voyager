# <p align = "center">**PublicUserFlags**</p>

<br>

# <p align = "center">*Properties*</p>

<br>

## PublicUserFlags.value: [number](https://create.roblox.com/docs/scripting/luau/numbers)
Flags combined as a bitfield.

<br>
<hr>
<br>

# <p align = "center">*Methods*</p>

<br>

## **PublicUserFlags.fromBitfield**(value: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [PublicUserFlags](docs/PublicUserFlags.md)
This method returns a new PublicUserFlags object.

*Note: This method is not meant to be called outside of Discohook's internal code.*

Parameters:

- value: A bitfield.

<br>
<hr>
<br>

## **PublicUserFlags:hasFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers)): [boolean](https://create.roblox.com/docs/scripting/luau/booleans)
This method will check whether the bitfield contains a specific flag.

Parameters:

- flag: The flag that'll be looked for.

<br>
<hr>
<br>

## **PublicUserFlags:setFlag**(flag: [number](https://create.roblox.com/docs/scripting/luau/numbers), toggle: [boolean](https://create.roblox.com/docs/scripting/luau/booleans)): [nil](https://create.roblox.com/docs/scripting/luau/nil)
This method will toggle a flag in the bitfield either to true or false.

Parameters:

- flag: The flag that'll be toggled.
- toggle: If true the flag will be added to bitfield, otherwise the flag will be removed from the bitfield.

<br>
<hr>
<br>

## **PublicUserFlags:getFlags**(): {[number](https://create.roblox.com/docs/scripting/luau/numbers)}
This method will return all of the flags that are in the bitfield.

<br>
<hr>
<br>
