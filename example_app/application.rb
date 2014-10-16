require 'lotus'

module ExampleApp
	class Application < Lotus::Application
		configure do
			root File.dirname(__FILE__)

      load_paths << [
        'controllers',
        'views'
      ]

      #controller_pattern "%{controller}Controller::%{action}"
      #view_pattern       "%{controller}::%{action}"

      routes do
        get '/',   to: 'home#index'#::Controllers::HomeController::Index
      end
		end
	end
end
