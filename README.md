<p align="center" width="100%">
    <img src="resources/Discohook_Banner.svg" alt="Discohook" height="128em"/>
</p>

<hr>

# Features

- Simple and easy to use.
- Fast set up.
- Flexible.

<hr>

# Installation

1. Get the [module script](https://www.roblox.com/library/12390338563).
2. Make sure http requests in Game Settings > Security is enabled.
3. Drag the module into your project and place it in ServerScriptService.
4. Now you can use Discohook.

<hr>

# Quick Example

```lua
local webhook = require(path_to_module_here).new("webhookId", "webhookToken")

webhook:execute("Hello, World!", nil, false, false)
```

<hr>

# Credit

Huge thanks to [@lewisakura](https://www.roblox.com/users/25704749/profile) for creating and hosting the [proxy](https://github.com/lewisakura/webhook-proxy) used in this module. Without them this module wouldn't have been possible.

<hr>