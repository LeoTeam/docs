# Support for the most common HTTP methods:

```ruby
router   = Lotus::Router.new
endpoint = ->(env) { [200, {}, ['Hello from Lotus!']] }

router.get    '/lotus', to: endpoint
router.post   '/lotus', to: endpoint
router.put    '/lotus', to: endpoint
router.patch  '/lotus', to: endpoint
router.delete '/lotus', to: endpoint
router.trace  '/lotus', to: endpoint
```
