# EmbedThumbnail
Represents an embed's thumbnail.

<br />

## Properties

---

<br />


### Url
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the url to the thumbnail's image.

<br />

---

<br />

### Width
An optional [*number*](https://create.roblox.com/docs/luau/numbers) that contains the thumbnails's width.

<br />

---

<br />

### Height
An optional [*number*](https://create.roblox.com/docs/luau/numbers) that contains the thumbnails's height.

<br />

---

<br />

### ProxiedUrl
An optional [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that contains a proxied url of the thumbnail's image.

<br />

---

<br />

## Constructors

---

<br />

### new(url)
This method returns a new [*EmbedThumbnail*](EmbedThumbnail.md) instance.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The thumbnail's url.

<br />

---

<br />

### _fromObject(embedThumbnailObject)
This method constructs an [*EmbedThumbnail*](EmbedThumbnail.md) instance from a [*thumbnail object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure). Returns a new [*EmbedThumbnail*](EmbedThumbnail.md) instance.

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- embedThumbnailObject : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*thumbnail object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### _ToObject()
This method returns a [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) in this [*structure*](https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

<br />

---

<br />

### _Validate()
Validates the thumbnail to avoid making a bad request to Discord. This method returns a tuple containing 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

<br />

---

<br />