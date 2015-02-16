# Implicit Not Found (404):

```ruby
router = Lotus::Router.new
router.call(Rack::MockRequest.env_for('/unknown')).status # => 404
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
