#module ExampleApp::Application::HomeController
#end
module Controllers
  class Home
    include Lotus::Controller

    class Index

      include Lotus::Action

      def call(params)
        @value = 'tom'
      end

    end
  end
end
