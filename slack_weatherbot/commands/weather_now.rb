# frozen_string_literal: true

require 'spec_helper'
module SlackWeatherbot
  module Commands
    class WeatherNow < SlackRubyBot::Commands::Base
      command 'weather now' do |client, data, _match|
        forecast = ForecastIO.forecast(40.7233, -74.0030).currently
        ap forecast
        parsed_forecast = "*#{forecast.summary}*\n
          *Current Temp:* #{forecast.temperature}°F\n
          *#{forecast.precipProbability}%* chance of rain"
        client.say(channel: data.channel, text: parsed_forecast)
      end
    end
  end
end
