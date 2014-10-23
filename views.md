# Lotus::View

The philosophy is based on separation between views and templates.

Unlike other Ruby frameworks, a view is an object.
In the context of MVC, that means, every action (Index, Edit, Update)
renders a view object. This object may or may not have an
associated template.

To achieve this separation of views and templates, Lotus uses [Mustache](http://mustache.github.io/).

## Views

A simple view contains a module, representing the view entity, and a
class representing the view action.

```ruby
require 'lotus/view'

module Articles
  class Index
    include Lotus::View
  end
end
```

*.. More to come*

## Templates

A template is a *html.erb* file. A view object will render a template
based its module and class name.

```ruby
module Articles
  class Create
    include Lotus::View
  end
end

Articles::Create.template  # => "articles/create"
```

*... More to come*

Like all other Lotus components, Lotus::View can be included into your
project individually.

*.. Example of including Lotus::View individually..*
