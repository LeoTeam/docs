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

