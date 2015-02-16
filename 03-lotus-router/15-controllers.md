# Controllers:

`Lotus::Router` has a special convention for controllers naming.
It allows to declare an action as an endpoint, with a special syntax: `<controller>#<action>`.

```ruby
Lotus::Router.new do
  get '/', to: 'welcome#index'
end
```

In the example above, the router will look for the `Welcome::Index` action.

## Namespaces

In applications where for maintainability or technical reasons, this convention
can't work, `Lotus::Router` can accept a `:namespace` option, which defines the
Ruby namespace where to look for actions.

For instance, given a Lotus full stack application called `Bookshelf`, the
controllers are available under `Bookshelf::Controllers`.

```ruby
Lotus::Router.new(namespace: Bookshelf::Controllers) do
  get '/', to: 'welcome#index'
end
```

In the example above, the router will look for the `Bookshelf::Controllers::Welcome::Index` action.

