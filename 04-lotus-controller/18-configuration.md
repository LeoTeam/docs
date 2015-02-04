# Configuration

Lotus::Controller can be configured with a DSL. It supports a few options:

```ruby
require 'lotus/controller'

Lotus::Controller.configure do
  # Handle exceptions with HTTP statuses (true) or don't catch them (false)
  # Argument: boolean, defaults to `true`
  #
  handle_exceptions true

  # If the given exception is raised, return that HTTP status
  # It can be used multiple times
  # Argument: hash, empty by default
  #
  handle_exception ArgumentError => 404

  # Register a format to mime type mapping
  # Argument: hash, key: format symbol, value: mime type string, empty by default
  #
  format custom: 'application/custom'

  # Define a default format to return in case of HTTP request with `Accept: */*`
  # If not defined here, it will return Rack's default: `application/octet-stream`
  # Argument: symbol, it should be already known. defaults to `nil`
  #
  default_format :html

  # Define a default charset to return in the `Content-Type` response header
  # If not defined here, it returns `utf-8`
  # Argument: string, defaults to `nil`
  #
  default_charset 'koi8-r'

  # Configure the logic to be executed when Lotus::Action is included
  # This is useful to DRY code by having a single place where to configure
  # shared behaviors like authentication, sessions, cookies etc.
  # Argument: proc
  #
  prepare do
    include Lotus::Action::Sessions
    include MyAuthentication
    use SomeMiddleWare

    before { authenticate! }
  end
end
```

All of the global configurations can be overwritten at the controller level.
Each controller and action has its own copy of the global configuration.

This means changes are inherited from the top to the bottom, but do not bubble
back up.

```ruby
require 'lotus/controller'

Lotus::Controller.configure do
  handle_exception ArgumentError => 400
end

module Articles
  class Create
    include Lotus::Action

    configure do
      handle_exceptions false
    end

    def call(params)
      raise ArgumentError
    end
  end
end

module Users
  class Create
    include Lotus::Action

    def call(params)
      raise ArgumentError
    end
  end
end

Users::Create.new.call({}) # => HTTP 400

Articles::Create.new.call({})
  # => raises ArgumentError because we set handle_exceptions to false
```
