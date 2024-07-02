# EmbedThumbnail
Represents an embed's thumbnail.

<br />

## Properties

---

<br />


### Url
A [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the thumbnail's url.

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
An optional [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) that contains a proxied url of the thumbnail.

<br />

---

<br />

## Constructors

---

<br />

### new(url)
This method returns a new [*EmbedImage*](EmbedImage.md) instance.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The thumbnail's url.

<br />

---

<br />

### _FromObject(embedImageObject)
This method returns a new [*EmbedImage*](EmbedImage.md) instance.

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

***Parameters***

- embedImageObject : [*Dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) - A [*thumbnail object*](https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure) returned by Discord.

<br />

---

<br />

## Methods

---

<br />

### _ToObject()
This method returns a [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries) in this [*structure*](https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure).

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

<br />

---

<br />

### _Validate()
Validates the thumbnail to avoid making a bad request to Discord. This method returns a tuple with 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ Warning "Internal Code Warning"
    This method is not meant to be used outside of Voyager's internal code.

??? Info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed.

<br />

---

<br />