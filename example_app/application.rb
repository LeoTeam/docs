require 'lotus'

module ExampleApp
	class Application < Lotus::Application
		configure do
			root File.dirname(__FILE__)
		end
	end
end
