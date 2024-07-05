# Contributing to Voyager

Every contribution makes Voyager just a little bit better, so thanks for taking the time to contribute!

## Bug Reports

The key to creating a good bug report is using the pre-made bug report issue template. The bug report template will help you properly structure your issue and, it will also help you include the required information maintainers need to reproduce the bug and fix it.

## Feature Requests

Creating a good feature request is just as simple as using the pre-made feature request template. It will help you properly describe your feature idea to maintainers. 

## Submiting a Pull Request

Submitting a pull request is simple, just make sure it focuses on a single aspect to not have scope creep and keep the style consistent to that found in the project.

### Code Style

Classes should be in the following style.

```lua
local Class = {}
Class.__index = Class

function Class.new()
	local self = setmetatable({}, Class)

	self.Example = "property example"

	return self
end

function Class:ExampleMethod() : string
    return "method example"
end

return Class
```

Class names, properties, methods and type names should be in pascal case.

Private class properties and method names should be prefixed with an _.

Any internal code inside methods should be in camel case.

### Commits

There isn't a specific style we follow for commits, just make sure the commit title is in this format "Update ...". 

A detailed description is expected with each commit, exceptions can be made for small changes though.

## Documentation

Voyager uses [*MkDocs*](https://www.mkdocs.org/) + [*Material for MkDocs*](https://squidfunk.github.io/mkdocs-material/) for the documentation site.

### Serving the docs page locally

To install the dependencies we need to build and serve the docs page locally we use pip.

It would be ideal to set up a [*Python virtual environment*](https://docs.python.org/3/library/venv.html#creating-virtual-environments) for this.

Once you activate your virtual environment, simply run the commands found in the project's [*dev docs workflow*](https://github.com/Jodenee/Voyager/blob/dev/.github/workflows/dev-docs.yml) file under the **Install dependencies** task **only**.

Now to serve the docs, simply run the following command. Also keep in mind that mkdocs serve will automatically rebuild and serve the site when you make changes.

```shell
python -m mkdocs serve
```

There may be some cases were you'd want to test the docs with the version control feature present. In that case run the following commands instead.

```shell
mike deploy dev
```

```shell
mike serve
```

Keep in mind that there is no hot reloading with mike, so anytime you make a change to the page you need to manually rebuild and serve the site.