# Named routes:

```ruby
router = Lotus::Router.new(scheme: 'https', host: 'lotusrb.org')
router.get '/lotus', to: ->(env) { [200, {}, ['Hello from Lotus!']] }, as: :lotus

router.path(:lotus) # => "/lotus"
router.url(:lotus)  # => "https://lotusrb.org/lotus"
```
