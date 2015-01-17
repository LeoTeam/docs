# HTTP Caching and Conditional Get

## HTTP Caching

__Lotus::Controller__ sets your headers correctly according to RFC 2616 / 14.9.

For more on standard cache control directives, consult
[RFC 2616](http://tools.ietf.org/html/rfc2616#section-14.9.1).

You can easily set the `Cache-Control` header for your actions:

```ruby
require 'lotus/controller'
require 'lotus/action/cache'

class HttpCacheController
  include Lotus::Action
  include Lotus::Action::Cache

  cache_control :public, max_age: 600 # => Cache-Control: public, max-age=600

  def call(params)
    # ...
  end
end
```

The `Expires` header can be specified using the `expires` method:

```ruby
require 'lotus/controller'
require 'lotus/action/cache'

class HttpCacheController
  include Lotus::Action
  include Lotus::Action::Cache

  expires 60, :public, max_age: 600 # => Expires: Sun, 03 Aug 2014 17:47:02 GMT, Cache-Control: public, max-age=600

  def call(params)
    # ...
  end
end
```

## Conditional GET

According to the HTTP specification, conditional `GET`s provide a way for web
servers to inform clients that the response to a GET request hasn't change
since the last request returning a Not Modified header (304).

Passing the `HTTP_IF_NONE_MATCH` (content identifier) or
`HTTP_IF_MODIFIED_SINCE` (timestamp) headers allows the web server define if
the client has a fresh version of a given resource.

You can easily take advantage of Conditional GET with the `#fresh` method:

```ruby
require 'lotus/controller'
require 'lotus/action/cache'

class ConditionalGetController
  include Lotus::Action
  include Lotus::Action::Cache

  def call(params)
    # ...
    fresh etag: @resource.cache_key
    # => halt 304 with header IfNoneMatch == @resource.cache_key
  end
end
```

If `@resource.cache_key` is equal to the `IfNoneMatch` header, then lotus will
`halt 304`.

The same behavior is accomplished using `last_modified`:

```ruby
require 'lotus/controller'
require 'lotus/action/cache'

class ConditionalGetController
  include Lotus::Action
  include Lotus::Action::Cache

  def call(params)
    # ...
    fresh last_modified: @resource.update_at
    # => halt 304 with header IfModifiedSince == @resource.update_at.httpdate
  end
end
```

If `@resource.update_at` is equal to `IfModifiedSince` header, then Lotus will
`halt 304`.

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
