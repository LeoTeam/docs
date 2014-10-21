Creating your first Lotus Application
==============

Before we get start, lets create a `config.ru` file, which will be our Rack
interface, and an `application.rb` file. Create these files under your project
directory.

    example_app
    	|_ application.rb
	    |_ config.ru

Now we can start adding some code to our `application.rb`. First lets require
lotus. Next, we can create a namespaced class that will represent our
application. Inside we can define our project route.

**application.rb**
```ruby
require 'lotus'

module ExampleApp
  class Application < Lotus::Application
    configure do
      root File.dirname(__FILE__)
    end
  end
end
```

If we require `application.rb` and add a call our `ExampleApp::Application`
class then we should be able to run our application via the `config.ru`.

**config.ru**

    require './application.rb'
    run ExampleApp::Application.new

At this point we are able to start the webserver.

    $  rackup config.ru
       Thin web server (v1.6.2 codename Doc Brown)
	   Maximum connections set to 1024
       Listening on 0.0.0.0:9292, CTRL+C to stop

Hitting [0.0.0.0:9292](http://0.0.0.0:9292) will result in a "Not Found" error
but, if we take a look at the console, Rack is actually listening for and
recieving our HTTP request.

