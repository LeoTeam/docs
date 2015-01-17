# Sessions

__Lotus::Controller__ has builtin support for Rack sessions:

```ruby
require 'lotus/controller'
require 'lotus/action/session'

class ReadSessionFromRackEnv
  include Lotus::Action
  include Lotus::Action::Session

  def call(params)
    # ...
    session[:age] # => '31'
  end
end

action = ReadSessionFromRackEnv.new
action.call({ 'rack.session' => { 'age' => '31' }})
```

Values can be set like a Hash:

```ruby
require 'lotus/controller'
require 'lotus/action/session'

class SetSession
  include Lotus::Action
  include Lotus::Action::Session

  def call(params)
    # ...
    session[:age] = 31
  end
end

action = SetSession.new
action.call({}) # => [200, {"Set-Cookie"=>"rack.session=..."}, "..."]
```

Values can be removed like a Hash:

```ruby
require 'lotus/controller'
require 'lotus/action/session'

class RemoveSession
  include Lotus::Action
  include Lotus::Action::Session

  def call(params)
    # ...
    session[:age] = nil
  end
end

action = RemoveSession.new
action.call({}) # => [200, {"Set-Cookie"=>"rack.session=..."}, "..."] it removes that value from the session
```

While Lotus::Controller supports sessions natively, it's __session store agnostic__.
You will need to specify the session store in your Rack middleware
configuration (eg `config.ru`).

```ruby
use Rack::Session::Cookie, secret: SecureRandom.hex(64)
run Show.new
```
