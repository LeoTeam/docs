# Stand-Alone Usage

## Requirements

__Lotus::Controller__ requires Ruby (MRI) 2+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lotus-controller'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install lotus-controller
```

## Lotus::Router integration

While Lotus::Router works great with this framework, Lotus::Controller doesn't
depend on it. You, as developer, are free to choose your own routing system.

But, if you use them together, the **only constraint is that an action must
support _arity 0_ in its constructor**. The following examples are valid
constructors:

```ruby
def initialize
end

def initialize(repository = Article)
end

def initialize(repository: Article)
end

def initialize(options = {})
end

def initialize(*args)
end
```

__Please note that this is subject to change: we're working to remove this
constraint.__

Lotus::Router supports lazy loading for controllers. While this policy can be a
convenient fallback, you should know that it's the slower option. **Be sure of
loading your controllers before you initialize the router.**


## Rack integration

Lotus::Controller is compatible with Rack. However, it doesn't mount any
middleware. While a Lotus application's architecture is more web oriented, this
framework is designed to build pure HTTP endpoints.


## Thread safety

Actions are **mutable**. When used without Lotus::Router, be sure to instantiate
an action for each request:

```ruby
# config.ru
require 'lotus/controller'

class Action
  include Lotus::Action

  def self.call(env)
    new.call(env)
  end

  def call(params)
    self.body = object_id.to_s
  end
end

run Action
```

Lotus::Controller heavely depends on class configuration. To ensure immutability
in deployment environments, please consider of invoke `Lotus::Controller.load!`.

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
