# Variables Constraints:

```ruby
router = Lotus::Router.new
router.get '/flowers/:id', id: /\d+/, to: ->(env) { [200, {}, [":id must be a number!"]] }
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
