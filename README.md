<p align="center" width="100%">
    <img src="docs/assets/images/Voyager_Banner.svg" alt="Discohook" height="128em"/>
</p>

<p align="center">
    <img src="https://img.shields.io/github/license/Jodenee/Discohook?color=1e1e1e&style=for-the-badge" alt="License"/>
    <img src="https://img.shields.io/github/issues/jodenee/Voyager?style=for-the-badge&color=1e1e1e" alt="Open Issues"/>
    <img src="https://img.shields.io/github/contributors/Jodenee/Discohook?color=1e1e1e&style=for-the-badge" alt="Contributors"/>
</p>

---

## **Key Features**

- Simple: Voyager is curated to be easily utilized by both beginner and advanced scripters.
- Flexible: Voyager is curated to be modular as to fit as many use cases as possible.
- Pre-request data validation: Voyager comes with built in validation functions that automatically validate any data you give it before making an HTTP request. This is done to mitigate making pointless requests to the proxy, as making too many bad requests may get you temporarily or indefinitely banned from the proxy.

---

## **Installation**

1. Get the [*module script*](https://www.roblox.com/library/12390338563).
2. Make sure http requests in Game Settings > Security is enabled.
3. Drag the module into your project and place it in ServerScriptService or ServerStorage.

---

## **Quick Example**

```lua
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:execute("Hello, World!")
```

---

## **Credit**

Huge thanks to [*@lewisakura*](https://www.roblox.com/users/25704749/profile) for creating and hosting the [*proxy*](https://github.com/lewisakura/webhook-proxy) used in this module. Without them this module wouldn't have been possible.

---

## **Tutorial/Documentation**

Learn how to use Voyager [*here*](https://jodenee.github.io/Voyager/latest/).

---