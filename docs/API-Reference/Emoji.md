# Emoji

<br />

## Properties

<br />

### **Emoji.id :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)

The emoji's id.

???+ note
    If the emoji isn't custom this will always be nil.

<br />

---

<br />

### **Emoji.name :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)

The emoji's name or unicode character.

???+ note
    If the emoji is a custom emoji then this'll return the name of the emoji. Otherwise it'll return it's unicode character.

<br />

---

<br />

### **Emoji.animated :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the emoji is animated.

<br />

---

<br />

## Methods

<br />

### **Emoji.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [Emoji](Emoji.md)
This function returns a new Emoji object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** An [*Emoji object*](https://discord.com/developers/docs/resources/emoji#emoji-object).

<br />

---

<br />