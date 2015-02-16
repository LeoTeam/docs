# RESTful Resource:

```ruby
router = Lotus::Router.new
router.resource 'identity'
```

It will map:

<table>
  <tr>
    <th>Verb</th>
    <th>Path</th>
    <th>Action</th>
    <th>Name</th>
    <th>Named Route</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity</td>
    <td>Identity::Show</td>
    <td>:show</td>
    <td>:identity</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity/new</td>
    <td>Identity::New</td>
    <td>:new</td>
    <td>:new_identity</td>
  </tr>
  <tr>
    <td>POST</td>
    <td>/identity</td>
    <td>Identity::Create</td>
    <td>:create</td>
    <td>:identity</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity/edit</td>
    <td>Identity::Edit</td>
    <td>:edit</td>
    <td>:edit_identity</td>
  </tr>
  <tr>
    <td>PATCH</td>
    <td>/identity</td>
    <td>Identity::Update</td>
    <td>:update</td>
    <td>:identity</td>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/identity</td>
    <td>Identity::Destroy</td>
    <td>:destroy</td>
    <td>:identity</td>
  </tr>
</table>

If you don't need all the default endpoints, just do:

```ruby
router = Lotus::Router.new
router.resource 'identity', only: [:edit, :update]

#### which is equivalent to:

router.resource 'identity', except: [:show, :new, :create, :destroy]
```


If you need extra endpoints:

```ruby
router = Lotus::Router.new
router.resource 'identity' do
  member do
    get 'avatar'           # maps to Identity::Avatar
  end

  collection do
    get 'authorizations'   # maps to Identity::Authorizations
  end
end

router.path(:avatar_identity)         # => /identity/avatar
router.path(:authorizations_identity) # => /identity/authorizations
```

```ruby
router = Lotus::Router.new
router.resources 'flowers'
```

It will map:

<table>
  <tr>
    <th>Verb</th>
    <th>Path</th>
    <th>Action</th>
    <th>Name</th>
    <th>Named Route</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/flowers</td>
    <td>Flowers::Index</td>
    <td>:index</td>
    <td>:flowers</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/flowers/:id</td>
    <td>Flowers::Show</td>
    <td>:show</td>
    <td>:flowers</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/flowers/new</td>
    <td>Flowers::New</td>
    <td>:new</td>
    <td>:new_flowers</td>
  </tr>
  <tr>
    <td>POST</td>
    <td>/flowers</td>
    <td>Flowers::Create</td>
    <td>:create</td>
    <td>:flowers</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/flowers/:id/edit</td>
    <td>Flowers::Edit</td>
    <td>:edit</td>
    <td>:edit_flowers</td>
  </tr>
  <tr>
    <td>PATCH</td>
    <td>/flowers/:id</td>
    <td>Flowers::Update</td>
    <td>:update</td>
    <td>:flowers</td>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/flowers/:id</td>
    <td>Flowers::Destroy</td>
    <td>:destroy</td>
    <td>:flowers</td>
  </tr>
</table>


```ruby
router.path(:flowers)              # => /flowers
router.path(:flowers, id: 23)      # => /flowers/23
router.path(:edit_flowers, id: 23) # => /flowers/23/edit
```

If you don't need all the default endpoints, just do:

```ruby
router = Lotus::Router.new
router.resources 'flowers', only: [:new, :create, :show]

#### which is equivalent to:

router.resources 'flowers', except: [:index, :edit, :update, :destroy]
```

If you need extra endpoints:

```ruby
router = Lotus::Router.new
router.resources 'flowers' do
  member do
    get 'toggle' # maps to Flowers::Toggle
  end

  collection do
    get 'search' # maps to Flowers::Search
  end
end

router.path(:toggle_flowers, id: 23)  # => /flowers/23/toggle
router.path(:search_flowers)          # => /flowers/search
```
