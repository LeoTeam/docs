# Cookies

Lotus::Controller offers convenient access to cookies.

They are read as a hash from the Rack environment:

```ruby
require 'lotus/controller'
require 'lotus/action/cookies'

class ReadCookiesFromRackEnv
  include Lotus::Action
  include Lotus::Action::Cookies

  def call(params)
    # ...
    cookies[:foo] # => 'bar'
  end
end

action = ReadCookiesFromRackEnv.new
action.call({'HTTP_COOKIE' => 'foo=bar'})
```

They are set like a Hash:

```ruby
require 'lotus/controller'
require 'lotus/action/cookies'

class SetCookies
  include Lotus::Action
  include Lotus::Action::Cookies

  def call(params)
    # ...
    cookies[:foo] = 'bar'
  end
end

action = SetCookies.new
action.call({}) # => [200, {'Set-Cookie' => 'foo=bar'}, '...']
```

They are removed by setting their value to `nil`:

```ruby
require 'lotus/controller'
require 'lotus/action/cookies'

class RemoveCookies
  include Lotus::Action
  include Lotus::Action::Cookies

  def call(params)
    # ...
    cookies[:foo] = nil
  end
end

action = SetCookies.new
action.call({}) # => [200, {'Set-Cookie' => "foo=; max-age=0; expires=Thu, 01 Jan 1970 00:00:00 -0000"}, '...']
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
