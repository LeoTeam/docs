# Redirect:

```ruby
router = Lotus::Router.new
router.get '/redirect_destination', to: ->(env) { [200, {}, ['Redirect destination!']] }
router.redirect '/legacy', to: '/redirect_destination'
```
