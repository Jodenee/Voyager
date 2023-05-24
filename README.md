<p align="center" width="100%">
    <img src="resources/Discohook_Banner.svg" alt="Discohook" height="128em"/>
</p>

<p align="center">
    <img src="https://img.shields.io/github/license/Jodenee/Discohook?color=5865F2&style=for-the-badge" alt="License"/>
    <img src="https://img.shields.io/maintenance/yes/2023?color=00FF84&style=for-the-badge" alt="Maintained"/>
    <img src="https://img.shields.io/github/contributors/Jodenee/Discohook?color=5865F2&style=for-the-badge" alt="Contributors"/>
</p>

<hr>

# Features

- Easy to use.
- Fast set up.
- Flexible.
- Easy integration.

<hr>

# Installation

1. Get the [module script](https://www.roblox.com/library/12390338563).
2. Make sure http requests in Game Settings > Security is enabled.
3. Drag the module into your project and place it in ServerScriptService or ServerStorage.
4. Now you can use Discohook.

<hr>

# Quick Example

```lua
local webhook = require(path_to_module_here.Webhook).new("webhookId", "webhookToken")

webhook:execute("Hello, World!", nil, false, false)
```

<hr>

# Credit

Huge thanks to [@lewisakura](https://www.roblox.com/users/25704749/profile) for creating and hosting the [proxy](https://github.com/lewisakura/webhook-proxy) used in this module. Without them this module wouldn't have been possible.

<hr>