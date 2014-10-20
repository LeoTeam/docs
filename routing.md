Routing
=======

..short introduction to Lotus routes..

To set up a root path we can use the `get` method and point to a
controller/action. Add a `routes` block inside your `configure`
block in the application.rb.

```ruby
routes do
  get '/',   to: 'home#index'
end
```

..more information about lotus routes, include a link to read more..
