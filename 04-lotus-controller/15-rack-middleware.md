# Rack middleware

Rack middleware can be configured globally in `config.ru`, but adding middlware
can often add unnecessary overhead for all those endpoints that aren't direct
users of a certain middleware.

Think about a middleware to create sessions, where only
`SessionsController::Create` needs that middleware, but every other action pays
the performance price for that middleware.

The solution is that an action can employ one or more Rack middleware, with
`.use`. This will keep the middleware isolated to that particular endpoint.

```ruby
require 'lotus/controller'

module Sessions
  class Create
    include Lotus::Action
    use OmniAuth
    use XMiddleware.new('x', 123)
    use YMiddleware.new

    def call(params)
      # ...
    end
  end
end
```
