# A Beautiful DSL:

```ruby
Lotus::Router.new do
  get '/', to: ->(env) { [200, {}, ['Hi!']] }
  get '/dashboard',   to: Dashboard::Index
  get '/rack-app',    to: RackApp.new
  get '/flowers',     to: 'flowers#index'
  get '/flowers/:id', to: 'flowers#show'

  redirect '/legacy', to: '/'

  mount Api::App, at: '/api'

  namespace 'admin' do
    get '/users', to: Users::Index
  end

  resource 'identity' do
    member do
      get '/avatar'
    end

    collection do
      get '/api_keys'
    end
  end

  resources 'robots' do
    member do
      patch '/activate'
    end

    collection do
      get '/search'
    end
  end
end
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
