# EmbedField
Represents an embed field.

<br />

## Properties

---

<br />


### Name
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the field's name.

<br />

---

<br />

### Value
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the field's value.

<br />

---

<br />

### InLine
An optional [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that represents whether the field will be displayed inline.

<br />

---

<br />

## Constructors

---

<br />

### new(name, value, inLine)
This method returns a new [*EmbedField*](EmbedField.md) instance.

***Parameters***

- name : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's name.
- value : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's value.
- inLine : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - Whether the field will be displayed inline.

<br />

---

<br />

### _FromObject(embedFieldObject)
This method returns a new [*EmbedField*](EmbedField.md) instance.

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- embedFieldObject : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*field object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-field-structure) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### _ToObject()
This method returns a [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) in this [*structure*](https://discord.com/developers/docs/resources/channel#embed-object-embed-field-structure).

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

<br />

---

<br />

### _Validate()
Validates the author to avoid making a pointless request to Discord. This method returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

??? Info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

<br />

---

<br />