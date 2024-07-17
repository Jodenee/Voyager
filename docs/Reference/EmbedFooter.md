# EmbedFooter
Represents an embed's footer.

<br />

## Properties

---

<br />


### Text
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the footer's text.

<br />

---

<br />

### IconUrl
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the url to the footer's icon.

<br />

---

<br />

### ProxiedIconUrl
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains a proxied url to the footer's icon.

<br />

---

<br />

## Constructors

---

<br />

### new(text, iconUrl)
This method returns a new [*EmbedFooter*](EmbedFooter.md) instance.

***Parameters***

- text : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The footer's text.
- iconUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - A url to an image.

<br />

---

<br />

### _fromObject(embedFooterObject)
This method constructs a [*EmbedFooter*](EmbedFooter.md) instance from a [*footer object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-footer-structure). Returns a new [*EmbedFooter*](EmbedFooter.md) instance.

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- embedFooterObject : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*footer object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-footer-structure) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### _ToObject()
This method returns a [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) in this [*structure*](https://discord.com/developers/docs/resources/channel#embed-object-embed-footer-structure).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

<br />

---

<br />

### _Validate()
Validates the footer to avoid making a bad request to Discord. This method returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

<br />

---

<br />