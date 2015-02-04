# Redirect

If you need to redirect the client to another resource, use `#redirect_to`:

```ruby
class Create
  include Lotus::Action

  def call(params)
    # ...
    redirect_to 'http://example.com/articles/23'
  end
end

action = Create.new
action.call({ article: { title: 'Hello' }}) # => [302, {'Location' => '/articles/23'}, '']
```

You can also redirect with a custom status code:

```ruby
class Create
  include Lotus::Action

  def call(params)
    # ...
    redirect_to 'http://example.com/articles/23', status: 301
  end
end

action = Create.new
action.call({ article: { title: 'Hello' }}) # => [301, {'Location' => '/articles/23'}, '']
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
