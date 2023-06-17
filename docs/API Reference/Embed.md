# Embed

<br />

## Properties

<br />

### **Embed.title :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
The title attached to the embed.

<br />

---

<br />

### **Embed.description :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
The description attached to the embed.

<br />

---

<br />

### **Embed.url :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
The url attached to the embed's title.

<br />

---

<br />

### **Embed.timestamp :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
An [*ISO8601 timestamp*](https://www.iso.org/iso-8601-date-and-time-format.html) attached to the embed's footer.

<br />

---

<br />

### **Embed.color :** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers)
The embed's color code.

<br />

---

<br />

### **Embed.footer :** {text **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), icon_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), proxy_icon_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)}?
The embed's footer.

???+ info
    proxy_icon_url is only returned if the embed object was returned by Discord.

<br />

---

<br />

### **Embed.image :** {url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), height **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), width **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), proxy_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)}?
The embed's image.

???+ info
    height, width and proxy_url are only returned if the embed object was returned by Discord.

<br />

---

<br />

### **Embed.thumbnail :** {url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), height **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), width **:** [*number?*](https://create.roblox.com/docs/scripting/luau/numbers), proxy_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)}?
The embed's thumbnail.

???+ info
    height, width and proxy_url are only returned if the embed object was returned by Discord.

<br />

---

<br />

### **Embed.author :** {name **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), icon_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), proxy_icon_url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)}?

The embed's author.

???+ warning
    This is **NOT** an [author](Author.md) object!

???+ info
    proxy_icon_url is only returned if the embed object was returned by Discord.

<br />

---

<br />

### **Embed.fields :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** {name **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), value **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), inLine **:** [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans)}}?
A table of field objects that are attached to the embed.

<br />

---

<br />

## Methods

<br />

### **Embed.new**(title **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), description **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*Embed*](Embed.md)
This method returns a new Embed object.

***Parameters***

- ***title:*** The title of the embed.
- ***description:*** The description of the embed.
- ***url:*** The url attached to the embed's title.

<br />

---

<br />

### **Embed:setTitle**(title **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's title with a new one.

***Parameters***

- ***title:*** The title of the embed.

<br />

---

<br />

### **Embed:setDescription**(description **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's description with a new one.

***Parameters***

- ***description:*** The description of the embed.

<br />

---

<br />

### **Embed:setUrl**(url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's url with a new one.

***Parameters***

- ***url:*** The url attached to the embed's title.

<br />

---

<br />

### **Embed:setTimestamp**(customTimestamp **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's timestamp with a new one.

???+ note
    If customTimestamp is left nil then the current timestamp will be used instead.

***Parameters***

- ***customTimestamp:*** A custom [*ISO8601 timestamp*](https://www.iso.org/iso-8601-date-and-time-format.html) for the embed.

<br />

---

<br />

### **Embed:setColor**(color3 **:** [*Color3*](https://create.roblox.com/docs/reference/engine/datatypes/Color3)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's color code with a new one.

***Parameters***

- ***color3:*** A color3 value.

<br />

---

<br />

### **Embed:setFooter**(text **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), iconUrl **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's footer with a new one.

???+ warning
    Only HTTPs urls are supported for the iconUrl parameter.

***Parameters***

- ***text:*** The footer's text.
- ***iconUrl:*** The footer's url.

<br />

---

<br />

### **Embed:setImage**(url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's image with a new one.

???+ warning
    Only HTTPs urls are supported for the url parameter.

***Parameters***

- ***url:*** The image's url.

<br />

---

<br />

### **Embed:setThumbnail**(url **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's thumbnail with a new one.

???+ warning
    Only HTTPs urls are supported for the url parameter.

***Parameters***

- ***url:*** The thumbnail's url.

<br />

---

<br />

### **Embed:setAuthor**(name **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings), url **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), iconUrl **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method overrides the embed's author with a new one.

???+ warning
    Only HTTPs urls are supported for the iconUrl parameter.

***Parameters***

- ***name:*** The author's name.
- ***url:*** The author's url.
- ***iconUrl:*** The icon's url.

<br />

---

<br />

### **Embed:addField**(name: [*string*](https://create.roblox.com/docs/scripting/luau/strings), value: [*string*](https://create.roblox.com/docs/scripting/luau/strings), inLine: [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans)): [*nil*](https://create.roblox.com/docs/scripting/luau/nil)
This method adds a new field to the embed.

***Parameters***

- ***name:*** The field's name.
- ***value:*** The field's value.
- ***inLine:*** Whether the field should display inline.

<br />

---

<br />

### **Embed:totalCharacters**(): [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
This method returns the total amount of characters in the embed.

<br />

---

<br />

### **Embed:colorToRGB**(): {r: [*number*](https://create.roblox.com/docs/scripting/luau/numbers), g: [*number*](https://create.roblox.com/docs/scripting/luau/numbers), b: [*number*](https://create.roblox.com/docs/scripting/luau/numbers)}?
This method returns the embed's color in rgb format.

<br />

---

<br />

### **Embed:_validate**() **:** ([*boolean*](https://create.roblox.com/docs/scripting/luau/booleans), [*string?*](https://create.roblox.com/docs/scripting/luau/strings))
This method validates the embed to avoid making a pointless request to discord.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

<br />

---

<br />