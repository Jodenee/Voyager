# OptionalSendMessageInfo

<br />

## Properties

<br />

### **OptionalSendMessageInfo.threadId :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
The id of the thread the message should go to.

<br />

---

<br />

### **OptionalSendMessageInfo.tts :** [*boolean*](https://create.roblox.com/docs/scripting/luau/strings)
Whether the message should be tts.

<br />

---

<br />

### **OptionalSendMessageInfo.usernameOverride :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
An override for the webhook's username.

<br />

---

<br />

### **OptionalSendMessageInfo.avatarOverride :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
A url to an image that'll override for the webhook's avatar.

<br />

---

<br />

### **OptionalSendMessageInfo.messageFlags :** [*MessageFlags*](MessageFlags.md)
A [*MessageFlags*](MessageFlags.md) object.

<br />

---

<br />

### **OptionalSendMessageInfo.threadName :** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)
The name of the thread to create.

???+ warning
    Requires the webhook's channel to be a forum channel!

<br />

---

<br />

## Methods

<br />

### **OptionalSendMessageInfo.new**(threadId **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), tts **:** [*boolean?*](https://create.roblox.com/docs/scripting/luau/booleans), usernameOverride **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), avatarOverride **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings), messageFlags **:** [*MessageFlags?*](MessageFlags.md), threadName **:** [*string?*](https://create.roblox.com/docs/scripting/luau/strings)) **:** [OptionalSendMessageInfo](OptionalSendMessageInfo.md)
This method returns a new OptionalSendMessageInfo object.

???+ warning
    If both threadId and threadName are given an error will occur!

???+ note
    If tts is left nil it will default to false. If messageFlags is left nil it will default to a MessageFlags object with a value of 0.

***Parameters***

- ***threadId:*** The id of the thread the message should be sent to.
- ***tts:*** Whether the message should be tts.
- ***usernameOverride:*** An override for the webhook's username.
- ***avatarOverride:*** An override for the webhook's avatar.
- ***messageFlags:*** A MessageFlags object.
- ***threadName:*** Name of the thread to create.

<br />

---

<br />