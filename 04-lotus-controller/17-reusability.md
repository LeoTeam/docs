# Lotus Controller

## Standalone Usage

## Reusability

Lotus::Controller can be used as a singleton framework. The application code
includes `Lotus::Controller` or `Lotus::Action` directly and the configuration
is unique per Ruby process.

While this is convenient for tiny applications, it doesn't fit well for more
complex scenarios, where we want micro applications to coexist together.
\[TODO: Explain why we would want to do this w.r.t. namespace creation.\]

```ruby
require 'lotus/controller'

module WebApp
  Controller = Lotus::Controller.duplicate
end

module ApiApp
  Controller = Lotus::Controller.duplicate(self) do
    handle_exception ArgumentError => 400
  end
end
```

The code above defines `WebApp::Controller` and `WebApp::Action`, to be used for
the `WebApp` endpoints, while `ApiApp::Controller` and `ApiApp::Action` have
a different configuration.
