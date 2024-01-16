# ThreadMessage

<br />

## Properties

<br />

### **ThreadMessage.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's id.

<br />

---

<br />

### **ThreadMessage.messageType :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message the message is.

<br />

---

<br />

### **ThreadMessage.content :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's content.

<br />

---

<br />

### **ThreadMessage.channelId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br />

---

<br />

### **ThreadMessage.author :** [*Author*](Author.md)
The the author of the message.

<br />

---

<br />

### **ThreadMessage.embeds :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}
A table of embeds that are attached to the message.

<br />

---

<br />

### **ThreadMessage.reactions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Reaction*](Reaction.md)}
A table of reactions to the message.

<br />

---

<br />

### **ThreadMessage.mentions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*User*](User.md)}
A table of users mentioned in the message.

<br />

---

<br />

### **ThreadMessage.mentionRoles :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)}
A table of role ids mentioned in the message.

<br />

---

<br />

### **ThreadMessage.pinned :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br />

---

<br />

### **ThreadMessage.mentionEveryone :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions @everyone.

<br />

---

<br />

### **ThreadMessage.tts :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br />

---

<br />

### **ThreadMessage.timestamp :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
A timestamp of when the message was sent in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use ***ThreadMessage.createdAt*** instead. 

<br />

---

<br />

### **ThreadMessage.createdAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was sent.

<br />

---

<br />

### **ThreadMessage.flags :** [*MessageFlags*](MessageFlags.md)
A [*MessageFlags*](MessageFlags.md) object representing the message's flags.

<br />

---

<br />

### **ThreadMessage.webhookId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the webhook that sent this message.

<br />

---

<br />

### **ThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
A number that represents the approximate position of the message in a thread.

<br />

---

<br />

### **ThreadMessage.jumpUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The jump url of the message.

<br />

---

<br />

## Methods

<br />

### **ThreadMessage.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [*ThreadMessage*](ThreadMessage.md)
This method returns a new ThreadMessage object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** A [*message object*](https://discord.com/developers/docs/resources/channel#message-object).