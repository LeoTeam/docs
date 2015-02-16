# Namespaced routes:

```ruby
router = Lotus::Router.new
router.namespace 'animals' do
  namespace 'mammals' do
    get '/cats', to: ->(env) { [200, {}, ['Meow!']] }, as: :cats
  end
end

# and it generates:

router.path(:animals_mammals_cats) # => "/animals/mammals/cats"
```
