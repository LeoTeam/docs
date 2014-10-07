# Creating your first Lotus Application

Create a new directory for your project. For this example, the new directory will be `example_app`.

Create an `application.rb` file. This will be our Lotus application.
Then create a `config.ru` file. This will be our Rack interface.

```console
example_app
  |_ application.rb
  |_ config.ru
```

Now we can start adding some code to our `application.rb`.

First require lotus.
Next, we can create a namespaced class to represent our application.
Inside the namespaced class define our project root.

This is our **application.rb** file.

```ruby
require 'lotus'

module ExampleApp
  class Application < Lotus::Application
  configure do
    root File.dirname(__FILE__)
  end
end
```

Now configure Rack to use our application.

Require the application file.
Then run a new instance of our application.

This is our **config.ru** file.

```ruby
require './application.rb'
run ExampleApp::Application.new
```

At this point we are able to start the webserver.

```console
$  rackup config.ru
   Thin web server (v1.6.2 codename Doc Brown)
 Maximum connections set to 1024
   Listening on 0.0.0.0:9292, CTRL+C to stop
```

We can visit [0.0.0.0:9292](http://0.0.0.0:9292).
With the above application, Rack will respond with a "Not Found" error.
But Rack is receiving our HTTP request.

