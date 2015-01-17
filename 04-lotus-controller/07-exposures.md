# Exposures

We know that actions are objects and Lotus::Action respects one of the pillars
of OOP: __encapsulation__. Other frameworks like Rails and Sinatra extract
instance variables (`@ivars`) and make them available to the view context.

Lotus::Action's solution is simple and powerful: `expose`. It's a thin layer on
top of `attr_reader`.

Using `expose` creates a getter for the given attribute, and adds it to the
_exposures_. Exposures (`#exposures`) are a set of attributes exposed to the
view.

By default, all Lotus::Actions expose `#params` and `#errors`.

```ruby
class Show
  include Lotus::Action

  expose :article

  def call(params)
    @article = Article.find params[:id]
  end
end

action = Show.new
action.call({ id: 23 })

assert_equal 23, action.article.id

puts action.exposures # => { article: <Article:0x007f965c1d0318 @id=23> }
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
