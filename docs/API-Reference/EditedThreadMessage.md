# EditedThreadMessage

<br />

## Properties

<br />

### **EditedThreadMessage.id :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's id.

<br />

---

<br />

### **EditedThreadMessage.messageType :** [*number*](https://create.roblox.com/docs/scripting/luau/numbers)
The type of message the message is.

<br />

---

<br />

### **EditedThreadMessage.content :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The message's content.

<br />

---

<br />

### **EditedThreadMessage.channelId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the channel the message was sent in.

<br />

---

<br />

### **EditedThreadMessage.author :** [*Author*](Author.md)
The the author of the message.

<br />

---

<br />

### **EditedThreadMessage.embeds :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Embed*](Embed.md)}
A table of embeds that are attached to the message.

<br />

---

<br />

### **EditedThreadMessage.reactions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*Reaction*](Reaction.md)}
A table of reactions to the message.

<br />

---

<br />

### **EditedThreadMessage.mentions :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*User*](User.md)}
A table of users mentioned in the message.

<br />

---

<br />

### **EditedThreadMessage.mentionRoles :** {[[*number*](https://create.roblox.com/docs/scripting/luau/numbers)] **:** [*string*](https://create.roblox.com/docs/scripting/luau/strings)}
A table of role ids mentioned in the message.

<br />

---

<br />

### **EditedThreadMessage.pinned :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message is pinned.

<br />

---

<br />

### **EditedThreadMessage.mentionEveryone :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message mentions @everyone.

<br />

---

<br />

### **EditedThreadMessage.tts :** [*boolean*](https://create.roblox.com/docs/scripting/luau/booleans)
Whether the message was a TTS message.

<br />

---

<br />

### **EditedThreadMessage.timestamp :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
A timestamp of when the message was sent in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use ***EditedThreadMessage.createdAt*** instead. 

<br />

---

<br />
### **EditedThreadMessage.createdAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was sent.

<br />

---

<br />

### **EditedThreadMessage.flags :** [*MessageFlags*](MessageFlags.md)
A [*MessageFlags*](MessageFlags.md) object representing the message's flags.

<br />

---

<br />

### **EditedThreadMessage.webhookId :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the webhook that sent this message.

<br />

---

<br />

### **EditedThreadMessage.position**: [number](https://create.roblox.com/docs/scripting/luau/numbers)
A number that represents the approximate position of the message in a thread.

<br />

---

<br />

### **EditedThreadMessage.editedTimestamp**: [string](https://create.roblox.com/docs/scripting/luau/strings)
When the message was edited in [*ISO8601 format*](https://www.iso.org/iso-8601-date-and-time-format.html).

???+ warning "Deprecation Notice"
    This property has been deprecated. Please use ***EditedMessage.createdAt*** instead. 

<br />

---

<br />

### **EditedThreadMessage.editedAt :** [*DateTime*](https://create.roblox.com/docs/reference/engine/datatypes/DateTime)
A datetime object representing when the message was last edited.

<br />

---

<br />

### **EditedThreadMessage.jumpUrl :** [*string*](https://create.roblox.com/docs/scripting/luau/strings)
The jump url of the message.

<br />

---

<br />

## Methods

<br />

### **EditedThreadMessage.new**(data **:** [*dictionary*](https://create.roblox.com/docs/scripting/luau/tables#dictionaries)) **:** [*EditedThreadMessage*](EditedThreadMessage.md)
This method returns a new EditedThreadMessage object.

???+ warning
    This method is not meant to be called outside of Voyager's internal code.

***Parameters***

- ***data:*** A [*message object*](https://discord.com/developers/docs/resources/channel#message-object).