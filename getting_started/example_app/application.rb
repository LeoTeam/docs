require 'lotus'

module ExampleApp
  class Application < Lotus::Application
    configure do
      root File.dirname(__FILE__)

      load_paths << [
        'controllers',
        'views'
      ]

      routes do
        get '/',   to: 'home#index'
      end
    end
  end
end
