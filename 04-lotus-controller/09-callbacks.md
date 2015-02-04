# Callbacks

Lotus::Controller offers a powerful, inheritable callback chain which is
executed before and/or after your `#call` method invocation:

```ruby
class Show
  include Lotus::Action

  before :authenticate, :set_article

  def call(params)
  end

  private
  def authenticate
    # ...
  end

  # `params` in the method signature is optional
  def set_article(params)
    @article = Article.find params[:id]
  end
end
```

Callbacks can also be expressed as anonymous lambdas:

```ruby
class Show
  include Lotus::Action

  before { ... } # do some authentication stuff
  before { |params| @article = Article.find params[:id] }

  def call(params)
  end
end
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
