# EditedMessage

<br />

## Properties

<br />

### **EditedMessage.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's id.

<br />

---

<br />

### **EditedMessage.messageType :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message the message is.

<br />

---

<br />

### **EditedMessage.content :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's content.

<br />

---

<br />

### **EditedMessage.channelId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br />

---

<br />

### **EditedMessage.author :** [*Author*](Author.md)
The the author of the message.

<br />

---

<br />

### **EditedMessage.embeds :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}
A table of embeds that are attached to the message.

<br />

---

<br />

### **EditedMessage.reactions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Reaction*](Reaction.md)}
A table of reactions that were added to the message.

<br />

---

<br />

### **EditedMessage.mentions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*User*](User.md)}
A table of users mentioned in the message.

<br />

---

<br />

### **EditedMessage.mentionRoles :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)}
A table of role ids mentioned in the message.

<br />

---

<br />

### **EditedMessage.pinned :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br />

---

<br />

### **EditedMessage.mentionEveryone :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions @everyone.

<br />

---

<br />

### **EditedMessage.tts :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br />

---

<br />

### **EditedMessage.timestamp :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
A timestamp of when the message was sent in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use *EditedMessage.createdAt* instead. 

<br />

---

<br />

### **EditedMessage.createdAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was sent.

<br />

---

<br />

### **EditedMessage.flags :** [*MessageFlags*](MessageFlags.md)
A [*MessageFlags*](MessageFlags.md) object representing the message's flags.

<br />

---

<br />

### **EditedMessage.webhookId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the webhook that sent this message.

<br />

---

<br />

### **EditedMessage.editedTimestamp :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
A timestamp of when the message was edited in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use ***EditedMessage.editedAt*** instead. 

<br />

---

<br />

### **EditedMessage.editedAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was last edited.

<br />

---

<br />

### **EditedMessage.jumpUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The jump url of the message.

<br />

---

<br />

## Methods

<br />

### **EditedMessage.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [*EditedMessage*](EditedMessage.md)
This method returns a new EditedMessage object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** A [*message object*](https://discord.com/developers/docs/resources/channel#message-object).

<br />

---

<br />