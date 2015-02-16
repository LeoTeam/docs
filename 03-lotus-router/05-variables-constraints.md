# Variables Constraints:

```ruby
router = Lotus::Router.new
router.get '/flowers/:id', id: /\d+/, to: ->(env) { [200, {}, [":id must be a number!"]] }
```
