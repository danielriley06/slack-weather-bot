# frozen_string_literal: true

module SlackWeatherBot
  module Commands
    class WeatherByLocation < SlackRubyBot::Commands::Base
      command 'weather in' do |client, data, match|
        location_coordinates = Geocoder.search("#{match[:expression]}").first.coordinates
        forecast = ForecastIO.forecast(location_coordinates[0], location_coordinates[1]).currently
        parsed_forecast = "*#{forecast.summary}*\n
          *Current Temp:* #{forecast.temperature}°F\n
          *#{forecast.precipProbability}%* chance of rain"
        client.say(channel: data.channel, text: parsed_forecast)
      rescue => e
        client.say(channel: data.channel, text: "Invalid location (#{e})")
      end
    end
  end
end
