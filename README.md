<p align="center" width="100%">
    <img src="docs/assets/images/Voyager_Banner.svg" alt="Discohook" height="128em"/>
</p>

<p align="center">
    <img src="https://img.shields.io/github/license/Jodenee/Discohook?color=1e1e1e&style=for-the-badge" alt="License"/>
    <img src="https://img.shields.io/github/issues/jodenee/Voyager?style=for-the-badge&color=1e1e1e" alt="Open Issues"/>
    <img src="https://img.shields.io/github/contributors/Jodenee/Discohook?color=1e1e1e&style=for-the-badge" alt="Contributors"/>
</p>

---

## Key Features

- **Simple:** Voyager is made to be easily used by both beginner and advanced scripters.
- **Flexible:** Voyager is very modular allowing it to fit many use cases.
- **Pre-request data validation:** Voyager comes with built in validation methods that automatically validate data to help you catch errors before they reach the proxy.

---

## Installation

### Creator Marketplace

1. Get the [*module script*](https://www.roblox.com/library/12390338563) off the creator marketplace.
2. Make sure http requests in Game Settings > Security is enabled.
3. Drag the module into your project and place it in ServerScriptService or ServerStorage.

### Model File

1. Go to the [*releases page*](https://github.com/Jodenee/Voyager/releases) and download the latest version of Voyager's model file.
2. Make sure http requests in Game Settings > Security is enabled.
3. Drag the module into your project and place it in ServerScriptService or ServerStorage.

### Wally

1. Go to Voyager's [*wally page*](https://wally.run/package/jodenee/voyager) and copy the install string found underneath the metadata section.
2. Open your wally.toml file and under \[dependencies\] paste the string you got from the previous step.
3. Open your prefered cli and run `wally install` in your projects directory.
4. Make sure http requests in Game Settings > Security is enabled.

---

## Quick Example

```lua
local Voyager = path_here.Voyager
local webhook = require(Voyager.Webhook).new("webhookId", "webhookToken")

webhook:SendMessage("Hello, world!")
```

---

## Tutorial/Documentation

Learn how to use Voyager [*here!*](https://jodenee.github.io/Voyager/latest/)

---

## Credit

Huge thanks to [*@lewisakura*](https://www.roblox.com/users/25704749/profile) for creating and hosting the [*proxy*](https://github.com/lewisakura/webhook-proxy) used in this library. Without them this project wouldn't have been possible. [*Support them here!*](https://buymeacoffee.com/lewisakura)

---