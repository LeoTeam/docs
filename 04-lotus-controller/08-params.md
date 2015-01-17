# Params

The request params are passed as an argument to the `#call` method.
If routed with *Lotus::Router*, it extracts the relevant bits from the Rack
`env` (eg the requested `:id`). Otherwise everything passed as is: the full
Rack `env` in production, and the given `Hash` for unit tests.

__With Lotus::Router:__

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
    puts params # => { id: 23 } extracted from Rack env
  end
end
```

__Standalone:__

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
    puts params # => { :"rack.version"=>[1, 2], :"rack.input"=>#<StringIO:0x007fa563463948>, ... }
  end
end
```

__Unit Testing:__

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
    puts params # => { id: 23, key: 'value' }, passed as it is from testing
  end
end

action   = Show.new
response = action.call({ id: 23, key: 'value' })
```

## Whitelisting

Params represent an untrusted input. For security reasons it's strongly
recommended to whitelist them:

```ruby
require 'lotus/controller'

class Signup
  include Lotus::Action

  params do
    param :first_name
    param :last_name
    param :email
  end

  def call(params)
    puts params[:first_name]     # => "Luca"
    puts params[:last_name]      # => "Guidi"
    puts params[:admin]          # => nil
  end
end
```

## Validations & Coercions

In many parts of your application, the set of possible values for each
individual parameter will likely be well-defined (that is, you will likely know
what sort of data represents a correct parameter).

It's a good idea to do some initial validation of your parameters before you
pass them onward to lower MVC layers&mdash;halting fulfillment of invalid requests
can shave a significant amount of time off your request.

Additionally, if you specify the `:type` option, the param will be coerced.

```ruby
require 'lotus/controller'

class Signup
  MEGABYTE = 1024 ** 2
  include Lotus::Action

  params do
    param :first_name,       presence: true
    param :last_name,        presence: true
    param :email,            presence: true, format: /@/,   confirmation: true
    param :password,         presence: true,                confirmation: true
    param :terms_of_service, acceptance: true
    param :avatar,           size: 0..(MEGABYTE * 3)
    param :age,              type: Integer, size: 18..99
  end

  def call(params)
    halt 400 unless params.valid?
    # ...
  end
end

action = Signup.new

action.call(valid_params) # => [200, {}, ...]
action.errors.empty?      # => true

action.call(invalid_params) # => [400, {}, ...]
action.errors               # =>  #<Lotus::Validations::Errors:0x007fabe4b433d0 @errors={...}>

action.errors.for(:email)
  # => [#<Lotus::Validations::Error:0x007fabe4b432e0 @attribute=:email, @validation=:presence, @expected=true, @actual=nil>]
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
