# String matching with optional tokens:

```ruby
router = Lotus::Router.new
router.get '/lotus(.:format)' to: ->(env) { [200, {}, ["You've requested #{ env['router.params'][:format] }!"]] }
```
