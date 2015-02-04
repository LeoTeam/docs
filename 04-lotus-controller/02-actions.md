# Actions

The most crucial part of Lotus::Controller is its actions. Each action
corresponds to an endpoint that responds to incoming HTTP requests.

```ruby
class Show
  include Lotus::Action

  def call(params)
    @article = Article.find params[:id]
  end
end
```

The usage of `Lotus::Action` follows the Lotus philosophy: include a module and
implement a minimal interface. In this case, the interface is one method:
`#call(params)`.

Lotus is designed to not interfere with inheritance. This is important, because
you can implement your own initialization strategy.

__An action is an object__. That's important because __you have the full control
over it__. In other words, you have the freedom to instantiate, inject
dependencies and test it, both at the unit and integration level.

In the example below, the action interfaces with an `Article` object. By
injecting the repository with a default fallback, we enable ourselves to pass
in a stubbed version in our tests, while we can avoid the need to explicitly
pass in the object in our application code. Likewise, because `#call` requires
an argument for its params, we are able to simulate any sort of parameters.

Note that __we're avoiding HTTP calls__. We can easily avoid hitting the
database by stubbing our repository. All we're dealing with is message
passing&mdash;dealing with interface rectitude. This lets us unit test the
majority of our controller functionality without having to load the entire
stack. To ensure cross-level functionality, we can write just a few simple
integration tests, because our unit tests will guarantee the function of this
controller. 

Needless to say, __this makes our test suite blazing fast__.

```ruby
class Show
  include Lotus::Action

  def initialize(repository = Article)
    @repository = repository
  end

  def call(params)
    @article = @repository.find params[:id]
  end
end

action = Show.new(MemoryArticleRepository)
action.call({ id: 23 })
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
