# String matching with globbing:

```ruby
router = Lotus::Router.new
router.get '/*', to: ->(env) { [200, {}, ["This is catch all: #{ env['router.params'].inspect }!"]] }
```
