# Contributing to Voyager

Every contribution makes Voyager just a little bit better, so thanks for taking the time to contribute!

## Bug Reports

The key to creating a good bug report is using the pre-made bug report issue template. The bug report template will help you properly structure your issue, and help you include the proper information maintainers need to reproduce and fix the bug.

## Feature Requests

Creating a good feature request is just as simple as using the pre-made feature request template. It will help you describe your feature idea to maintainers. 

## Submitting a Pull Request

Submitting a pull request is simple, just make sure it focuses on a single aspect prevent scope creep and keep the style consistent to that found in the project.

### Setting Up The Development Environment

First you need to install rojo, this can be done through aftman. (This is assuming you have aftman already installed)

```shell
aftman install
```

Now that rojo is installed, you need to build the development environment.

```shell
rojo build -o Voyager.rbxlx
```

Great! Now all we need to do is serve the dev_env project using rojo.

```shell
rojo serve dev_env.project.json
```

Now that rojo is synchronising changes with the Voyager.rbxlx file, you can apply the changes you wish to add by editing the code found in [*src/Voyager*](src/Voyager) with a code editor of your choice.

After you apply your changes you will need to test them. You can test your changes by opening the Voyager.rbxlx file in roblox studio, then navigate to ServerScriptService and look for a file named "Voyager Development", this is where you can test your changes. 

When you first open the file it will be blank, to save you some time you can copy and paste the code found below for a quick start.

```lua
--// Get voyager
local voyager = game:GetService("ServerStorage").Voyager

--// Get classes
local Webhook = require(voyager.Webhook)
local Embed = require(voyager.Embed)
local VoyagerEnum = require(voyager.Enum)
local OptionalSendMessageInfo = require(voyager.OptionalSendMessageInfo)
local MessageFlags = require(voyager.MessageFlags)

--// Get formatters
local dateFormatter = require(voyager.Utilities.Formatters.DateFormatter)
local emojiFormatter = require(voyager.Utilities.Formatters.EmojiFormatter)
local mentionFormatter = require(voyager.Utilities.Formatters.MentionFormatter)

--// Define credentials

local webhookId = "Id"
local webhookToken = "Token"

--// Code

local webhook = Webhook.new(webhookId, webhookToken)

-- You can continue from here.
```

### Code Style

Classes should be in the following style.

```lua
local Class = {}
Class.__index = Class

function Class.new()
	local self = setmetatable({}, Class)

	self.Example = "public property example"
	self._Example = "private property example"

	return self
end

function Class:ExampleMethod() : string
    return "public method example"
end

function Class:_ExampleMethod() : string
    return "private method example"
end

return Class
```

Class names, properties, methods and type names should be in pascal case.

Private class properties and method names should be prefixed with an _.

Any internal code inside methods should be in camel case.

### Commits

There isn't a specific style we follow for commits, just make sure the commit title is in this format "Update ...", "Add ...", "Remove ...". 

A detailed description is expected with each commit, exceptions can be made for small changes though.

## Documentation

Voyager uses [*MkDocs*](https://www.mkdocs.org/) + [*Material for MkDocs*](https://squidfunk.github.io/mkdocs-material/) for the documentation site.

### Serving the docs page locally

To install the dependencies we need to build and serve the docs page locally we use pip.

It would be ideal to set up a [*Python virtual environment*](https://docs.python.org/3/library/venv.html#creating-virtual-environments) for this.

Once you activate your virtual environment, simply run the commands found in the project's [*dev docs workflow*](https://github.com/Jodenee/Voyager/blob/dev/.github/workflows/dev-docs.yml) file under the **Install dependencies** task **only**.

Now to serve the docs, simply run the following command.

```shell
python -m mkdocs serve
```

Keep in mind that mkdocs serve will automatically rebuild and serve the site when you make changes.

There may be some cases were you'd want to test the docs with the version control feature present. In that case run the following commands instead.

```shell
mike deploy dev
```

```shell
mike serve
```

Keep in mind that there is no hot reloading with mike, so anytime you make a change to the page you need to manually rebuild and serve the site.