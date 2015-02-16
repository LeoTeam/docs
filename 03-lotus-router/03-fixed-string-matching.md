# Fixed string matching:

```ruby
router = Lotus::Router.new
router.get '/lotus', to: ->(env) { [200, {}, ['Hello from Lotus!']] }
```

