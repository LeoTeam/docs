# Overview

Lotus Helpers contains various methods to be used in your views.

###Usage

To use, include Lotus Helpers in your view.

    class BlogsView
      include Lotus::Helpers::HtmlHelper

      def title
        html.h1('Title')
      end
    end

###helpers

Below is a list of the helpers available:

|Helper         |Description                                                                  |
|-------------- |---------------------------------------------------------------------------- |
|HTML Helpers   |A number of methods for generating html. Example usage: `html.div('content')`|
|LinkTo Helper  |A link generator. Example usage: `link_to('blogs', :blogs_path)`             |
|Number Helper  |A number formatter. Example usage: `format_number 3.1415, precison: 3`       |
