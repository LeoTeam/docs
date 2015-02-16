# Mount Rack applications:

```ruby
Lotus::Router.new do
  mount RackOne,                             at: '/rack1'
  mount RackTwo,                             at: '/rack2'
  mount RackThree.new,                       at: '/rack3'
  mount ->(env) {[200, {}, ['Rack Four']]},  at: '/rack4'
  mount 'dashboard#index',                   at: '/dashboard'
end
```

1. `RackOne` is used as it is (class), because it respond to `.call`
2. `RackTwo` is initialized, because it respond to `#call`
3. `RackThree` is used as it is (object), because it respond to `#call`
4. That Proc is used as it is, because it respond to `#call`
5. That string is resolved as `Dashboard::Index` ([Lotus::Controller](https://github.com/lotus/controller) integration)


**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
