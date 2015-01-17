# Controllers

A Controller is nothing more than a logical grouping of actions: just a Ruby
module. This is sometimes preferable to write for conciseness.

```ruby
module Articles
  class Index
    include Lotus::Action

    # ...
  end

  class Show
    include Lotus::Action

    # ...
  end
end

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
