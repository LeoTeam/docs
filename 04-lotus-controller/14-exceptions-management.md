# Exceptions management

When an exception is raised, it automatically sets the HTTP status to
[500](http://httpstatus.es/500):

```ruby
class Show
  include Lotus::Action

  def call(params)
    raise
  end
end

action = Show.new
action.call({}) # => [500, {}, ["Internal Server Error"]]
```

You can map a specific raised exception to a different HTTP status.

```ruby
class Show
  include Lotus::Action
  handle_exception RecordNotFound => 404

  def call(params)
    @article = Article.find params[:id]
  end
end

action = Show.new
action.call({id: 'unknown'}) # => [404, {}, ["Not Found"]]
```

You can also define custom handlers for exceptions.

```ruby
class Create
  include Lotus::Action
  handle_exception ArgumentError => :my_custom_handler

  def call(params)
    raise ArgumentError.new("Invalid arguments")
  end

  private
  def my_custom_handler(exception)
    status 400, exception.message
  end
end

action = Create.new
action.call({}) # => [400, {}, ["Invalid arguments"]]
```

Exception policies can be defined globally, **before** the controllers/actions
are loaded.

```ruby
Lotus::Controller.configure do
  handle_exception RecordNotFound => 404
end

class Show
  include Lotus::Action

  def call(params)
    @article = Article.find params[:id]
  end
end

action = Show.new
action.call({id: 'unknown'}) # => [404, {}, ["Not Found"]]
```

This feature can be turned off globally, in a controller or in a single action.

```ruby
Lotus::Controller.configure do
  handle_exceptions false
end

# or

module Articles
  class Show
    include Lotus::Action

    configure do
      handle_exceptions false
    end

    def call(params)
      @article = Article.find params[:id]
    end
  end
end

action = Articles::Show.new
action.call({id: 'unknown'}) # => raises RecordNotFound
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
