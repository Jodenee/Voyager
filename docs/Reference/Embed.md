# Embed
Represents embeds.

<br />

## Properties

---

<br />


### Title
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the embed's title.

<br />

---

<br />

### Description
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the embed's description.

<br />

---

<br />

### Url
An optional [*string*](https://create.roblox.com/docs/scripting/luau/strings) that contains the embed's url.

<br />

---

<br />

### Timestamp
An optional [*Datetime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime) instance representing the embed's timestamp.

<br />

---

<br />

### Color
An optional [*Color3*](https://create.roblox.com/docs/reference/engine/datatypes/Color3) instance representing the embed's color.

<br />

---

<br />

### Footer
An optional [*EmbedFooter*](EmbedFooter.md) instance representing the embed's footer.

???+ info
    ProxyIconUrl is only returned if the embed object was returned by Discord.

<br />

---

<br />

### Image
An optional [*EmbedImage*](EmbedImage.md) instance representing the embed's image.

???+ info
    The following properties: Height, Width and ProxyUrl are only returned if the embed object was returned by Discord.

<br />

---

<br />

### Thumbnail
An optional [*EmbedThumbnail*](EmbedThumbnail.md) instance representing the embed's Thumbnail.

???+ info
    The following properties: Height, Width and ProxyUrl are only returned if the embed object was returned by Discord.

<br />

---

<br />

### Author
An optional [*EmbedAuthor*](EmbedAuthor.md) instance representing the embed's author.

???+ info
    ProxyIconUrl is only returned if the embed object was returned by Discord.

<br />

---

<br />

### Fields
A table of [*EmbedField*](EmbedField.md) instances representing the embed's fields.

<br />

---

<br />

## Constructors

---

<br />

### new(title, description, url, timestamp, color, footer, image, thumbnail, author, fields)
This method returns a new [*Embed*](Embed.md) instance.

***Parameters***

- title : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - Sets the title of the embed during initialisation.
- description : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - Sets the description of the embed during initialisation.
- url : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - Sets the url attached to the embed's title during initialisation.
- timestamp : [*Datetime?*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime) - Sets the embed's timestamp during initialisation.
- color : [*Color3?*](https://create.roblox.com/docs/reference/engine/datatypes/Color3) - Sets the embed's color during initialisation.
- footer : [*EmbedFooter?*](EmbedFooter.md) - Sets the embed's footer during initialisation.
- image : [*EmbedImage?*](EmbedImage.md) - Sets the embed's image during initialisation.
- thumbnail : [*EmbedThumbnail?*](EmbedThumbnail.md) - Sets the embed's thumbnail during initialisation.
- author : [*EmbedAuthor?*](EmbedAuthor.md) - Sets the embed's author during initialisation.
- fields : { [*EmbedField?*](EmbedField.md) } - Sets the embed's fields during initialisation.

<br />

---

<br />

## Methods

---

<br />

### SetTitle(title)
This method sets the embed's title. Returns [*self*](Embed.md) to allow chaining.

***Parameters***

- title : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The title of the embed.

<br />

---

<br />

### SetDescription(description)
This method sets the embed's description. Returns [*self*](Embed.md) to allow chaining.

***Parameters***

- description :  [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The description of the embed.

<br />

---

<br />

### SetUrl(url)
This method sets the embed's url. Returns [*self*](Embed.md) to allow chaining.

??? info
    If the embed title is absent, this makes no changes.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The url of the title hyperlink.

<br />

---

<br />

### SetTimestamp(customTimestamp)
This method sets the embed's timestamp. Returns [*self*](Embed.md) to allow chaining.

???+ info "Default Parameter Values"
    customTimestamp: `Datetime.now()`

***Parameters***

- customTimestamp : [*Datetime?*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime) - Sets the embed's timestamp to a datetime of your choosing.

<br />

---

<br />

### SetColor(color3)
This method sets the embed's color code. Returns [*self*](Embed.md) to allow chaining.

***Parameters***

- color3 : [*Color3*](https://create.roblox.com/docs/reference/engine/datatypes/Color3) - The embed's new color.

<br />

---

<br />

### SetFooter(text, iconUrl)
This method sets the embed's footer. Returns [*self*](Embed.md) to allow chaining.

??? info
    Only urls that use the HTTPS protocol are allowed to be used for the iconUrl parameter.

***Parameters***

- text : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The footer's text.
- iconUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The footer's url.

<br />

---

<br />

### SetImage(url)
This method sets the embed's image. Returns [*self*](Embed.md) to allow chaining.

??? info
    Only urls that use the HTTPS protocol are allowed to be used for the url parameter.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The image's url.

<br />

---

<br />

### SetThumbnail(url)
This method sets the embed's thumbnail. Returns [*self*](Embed.md) to allow chaining.

??? info
    Only urls that use the HTTPS protocol are allowed to be used for the url parameter.

***Parameters***

- url : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The thumbnail's url.

<br />

---

<br />

### SetAuthor(name, url, iconUrl)
This method sets the embed's author. Returns [*self*](Embed.md) to allow chaining.

??? info
    Only urls that use the HTTPS protocol are allowed to be used for the iconUrl parameter.

***Parameters***

- name : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The author's name.
- url : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The author's url.
- iconUrl : [*string?*](https://create.roblox.com/docs/scripting/luau/strings) - The author's icon url.

<br />

---

<br />

### AddField(name, value, inLine)
Appends a field to the embed. Returns [*self*](Embed.md) to allow chaining.

???+ info "Default Parameter Values"
    inLine: `true`

***Parameters***

- name : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's name.
- value : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's value.
- inLine : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether the field should display inline.

<br />

---

<br />

### SetFieldAt(index, name, value, inLine)
Modifies a field belonging to the embed. Returns [*self*](Embed.md) to allow chaining.

***Parameters***

- index : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The index of the field to modify.
- name : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's name.
- value : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The field's value.
- inLine : [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans) - Whether the field should display inline.

<br />

---

<br />

### RemoveFieldAt(index)
Removes the field at the specified index. Returns [*self*](Embed.md) to allow chaining.

***Parameters***

- index : [*string*](https://create.roblox.com/docs/scripting/luau/strings) - The index of the field to remove.

<br />

---

<br />

### RemoveAllFields()
Removes every field belonging to the embed. Returns [*self*](Embed.md) to allow chaining.

<br />

---

<br />

### TotalCharacters()
Returns a [*number*](https://create.roblox.com/docs/scripting/luau/numbers) representing the total amount of characters in the embed.

<br />

---

<br />

### _Validate()
Validates the embed to avoid making a bad request to Discord. This method returns a tuple containing 2 items a [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans) and an optional [*string*](https://create.roblox.com/docs/scripting/luau/strings).

???+ warning "Internal Code warning"
    This method is not meant to be used outside of Voyager's internal code.

??? info
    The boolean value indicates whether the validation was successful, and the optional string contains the error message if validation failed. 

<br />

---

<br />