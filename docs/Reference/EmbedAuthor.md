# EmbedAuthor
Represents an embed's author.

<br />

## Properties

---

<br />


### Name
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the author's text.

<br />

---

<br />

### Url
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the author's url.

<br />

---

<br />

### IconUrl
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the authors's icon url.

<br />

---

<br />

### ProxiedIconUrl
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains a proxied url to the author's icon.

<br />

---

<br />

## Constructors

---

<br />

### new(name, url, iconUrl)
This method returns a new [*EmbedAuthor*](EmbedAuthor.md) instance.

***Parameters***

- name : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The author's name.
- url : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - A url.
- iconUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - A url to an image.

<br />

---

<br />

### _FromObject(embedAuthorObject)
This method returns a new [*EmbedAuthor*](EmbedAuthor.md) instance.

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- embedAuthorObject : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*author object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-author-structure) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### _ToObject()
This method returns a [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) in this [*structure*](https://discord.com/developers/docs/resources/channel#embed-object-embed-author-structure).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

<br />

---

<br />

### _Validate()
Validates the author to avoid making a bad request to Discord. This method returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

<br />

---

<br />