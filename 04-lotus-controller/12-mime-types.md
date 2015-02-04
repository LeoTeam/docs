# Mime Types

Lotus::Action automatically sets the `Content-Type` header, according to the
request.

```ruby
class Show
  include Lotus::Action

  def call(params)
  end
end

action = Show.new

action.call({ 'HTTP_ACCEPT' => '*/*' }) # Content-Type "application/octet-stream"
action.format                           # :all

action.call({ 'HTTP_ACCEPT' => 'text/html' }) # Content-Type "text/html"
action.format                                 # :html
```

However, you can force this value:

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
    self.format = :json
  end
end

action = Show.new

action.call({ 'HTTP_ACCEPT' => '*/*' }) # Content-Type "application/json"
action.format                           # :json

action.call({ 'HTTP_ACCEPT' => 'text/html' }) # Content-Type "application/json"
action.format                                 # :json
```

You can restrict the accepted mime types:

```ruby
class Show
  include Lotus::Action
  accept :html, :json

  def call(params)
    # ...
  end
end

# When called with "\*/\*"            => 200
# When called with "text/html"        => 200
# When called with "application/json" => 200
# When called with "application/xml"  => 406
```

You can check if the requested mime type is accepted by the client.

```ruby
class Show
  include Lotus::Action

  def call(params)
    # ...
    # @_env['HTTP_ACCEPT'] # => 'text/html,application/xhtml+xml,application/xml;q=0.9'

    accept?('text/html')        # => true
    accept?('application/xml')  # => true
    accept?('application/json') # => false
    self.format                 # :html



    # @_env['HTTP_ACCEPT'] # => '*/*'

    accept?('text/html')        # => true
    accept?('application/xml')  # => true
    accept?('application/json') # => true
    self.format                 # :html
  end
end
```

Lotus::Controller is shipped with an extensive list of the most common mime types.
Also, you can register your own:

```ruby
Lotus::Controller.configure do
  format custom: 'application/custom'
end

class Index
  include Lotus::Action

  def call(params)
  end
end

action = Index.new

action.call({ 'HTTP_ACCEPT' => 'application/custom' }) # => Content-Type 'application/custom'
action.format                                          # => :custom

class Show
  include Lotus::Action

  def call(params)
    # ...
    self.format = :custom
  end
end

action = Show.new

action.call({ 'HTTP_ACCEPT' => '*/*' }) # => Content-Type 'application/custom'
action.format                           # => :custom
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
