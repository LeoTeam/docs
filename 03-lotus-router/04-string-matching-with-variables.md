# String matching with variables:

```ruby
router = Lotus::Router.new
router.get '/flowers/:id', to: ->(env) { [200, {}, ["Hello from Flower no. #{ env['router.params'][:id] }!"]] }
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
