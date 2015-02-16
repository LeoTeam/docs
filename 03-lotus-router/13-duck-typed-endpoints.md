# Duck typed endpoints:

Everything that responds to `#call` is invoked as it is:

```ruby
router = Lotus::Router.new
router.get '/lotus',      to: ->(env) { [200, {}, ['Hello from Lotus!']] }
router.get '/middleware', to: Middleware
router.get '/rack-app',   to: RackApp.new
router.get '/method',     to: ActionControllerSubclass.action(:new)
```


If it's a string, it tries to instantiate a class from it:

```ruby
class RackApp
  def call(env)
    # ...
  end
end

router = Lotus::Router.new
router.get '/lotus', to: 'rack_app' # it will map to RackApp.new
```

It also supports Controller + Action syntax:

```ruby
module Flowers
  class Index
    def call(env)
      # ...
    end
  end
end

router = Lotus::Router.new
router.get '/flowers', to: 'flowers#index' # it will map to Flowers::Index.new
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
