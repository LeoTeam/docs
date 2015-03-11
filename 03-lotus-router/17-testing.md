## Testing

```ruby
require 'lotus/router'
require 'rack/request'

router = Lotus::Router.new do
  get '/', to: ->(env) { [200, {}, ['Hi!']] }
end

app = Rack::MockRequest.new(router)
app.get('/') # => #<Rack::MockResponse:0x007fc4540dc238 ...>
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
