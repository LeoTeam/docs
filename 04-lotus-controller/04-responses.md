# Responses

The output of `#call` is a serialized Rack::Response (see
[#finish](http://rubydoc.info/github/rack/rack/master/Rack/Response#finish-instance_method)):

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
  end
end

action = Show.new
action.call({}) # => [200, {}, [""]]
```

It has private accessors to explicitly set status, headers and body:

```ruby
class Show
  include Lotus::Action

  def call(params)
    self.status  = 201
    self.body    = 'Hi!'
    self.headers.merge!({ 'X-Custom' => 'OK' })
  end
end

action = Show.new
action.call({}) # => [201, { "X-Custom" => "OK" }, ["Hi!"]]
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
