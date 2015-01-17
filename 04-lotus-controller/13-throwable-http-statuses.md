# Throwable HTTP statuses

When `#halt` is used with a valid HTTP code, it stops the execution and sets
the proper status and body for the response:

```ruby
class Show
  include Lotus::Action

  before :authenticate!

  def call(params)
    # ...
  end

  private
  def authenticate!
    halt 401 unless authenticated?
  end
end

action = Show.new
action.call({}) # => [401, {}, ["Unauthorized"]]

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
