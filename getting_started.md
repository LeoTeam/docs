Getting Started with Lotus
--------------------------
Welcome to Lotus! This guide will take you through creating a simple application
using Lotus and in doing so, will explain some of the frameworks core concepts.

This guide assumes you are already familiar with Ruby.

What is Lotus?
--------------------------
blah blah

Installing Lotus
--------------------------
To run Lotus you will need to have Ruby installed, open up a command line prompt
and check to see wether you have it installed:

```bash
$ ruby -v
ruby 2.0.0p353
```

If you don't have Ruby installed look at [ruby-lang.org](http://ruby-lang.org)
for an installation guide.

Now you are in a position to install Lotus. To install through Bundler add the
line below to your Gemfile:

```bash
$ gem 'lotusrb'
```

And then execute:

```bash
$ bundle
```

To install locally, run:

```bash
$ gem install lotusrb
```

Hello World
==============
Lets create a simple application using Lotus. This application will have a
single route displaying the string 'Hello from Lotus!'. The application will be
served using [Rack](http://wikipedia.org/wiki/Rack_%28web_server_interface%29).

Create a file called `config.ru` and insert the code below.

```ruby
require 'lotus'

class TinyApp < Lotus::Application
  configure do
    routes do
      get '/', to: ->(env) {[200, {}, ['Hello from Lotus!']]} # Direct Rack response
    end
  end
end

run TinyApp.new
```

In this example we create `TinyApp`, extending `Lotus::Application`. This will
inherit all the functionality of `Lotus::Router`, allowing us to configure
a route for the base URL. The route passes a hash containing a 200 response, and
response body 'Hello from Lotus!', to be handled by Rack.

Run `rackup` to start Thin and you will see your hello world page on [0.0.0.0:9292](http://0.0.0.0:9292).

Creating your first Lotus Application
==============
