require 'sinatra/base'

module SlackWeatherbot
  # Public: This is the entrypoint for the Sinatra webapp
  class Web < Sinatra::Base
    get '/' do
      'This is the Weatherbot for Slack'
    end
  end
end
