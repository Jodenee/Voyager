# Message

<br />

## Properties

<br />

### **Message.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's id.

<br />

---

<br />

### **Message.messageType :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message the message is.

<br />

---

<br />

### **Message.content :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's content.

<br />

---

<br />

### **Message.channelId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br />

---

<br />

### **Message.author :** [*Author*](Author.md)
The the author of the message.

<br />

---

<br />

### **Message.embeds :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}
A table of embeds that are attached to the message.

<br />

---

<br />

### **Message.reactions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Reaction*](Reaction.md)}
A table of reactions to the message.

<br />

---

<br />

### **Message.mentions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*User*](User.md)}
A table of users mentioned in the message.

<br />

---

<br />

### **Message.mentionRoles :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)}
A table of role ids mentioned in the message.

<br />

---

<br />

### **Message.pinned :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br />

---

<br />

### **Message.mentionEveryone :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions @everyone.

<br />

---

<br />

### **Message.tts :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br />

---

<br />

### **Message.timestamp :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
A timestamp of when the message was sent in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use ***Message.createdAt*** instead. 

<br />

---

<br />

### **Message.createdAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was sent.

<br />

---

<br />

### **Message.flags :** [*MessageFlags*](MessageFlags.md)
A [*MessageFlags*](MessageFlags.md) object representing the message's flags.

<br />

---

<br />

### **Message.webhookId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the webhook that sent this message.

<br />

---

<br />

### **Message.jumpUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The jump url of the message.

<br />

---

<br />

## Methods

<br />

### **Message.new**(data: [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)): [*Message*](Message.md)
This method returns a new Message object.

???+ warning
    This method is not meant to be used outside Voyager's internal code.

***Parameters***

- ***data:*** A [message object](https://discord.com/developers/docs/resources/channel#message-object).

<br />

---

<br />