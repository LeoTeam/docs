# Implicit Not Found (404):

```ruby
router = Lotus::Router.new
router.call(Rack::MockRequest.env_for('/unknown')).status # => 404
```
