# frozen_string_literal: true

module SlackWeatherbot
  module Commands
    class WeatherTomorrow < SlackRubyBot::Commands::Base
      command 'weather tomorrow' do |client, data, _match|
        forecast = ForecastIO.forecast(40.7233, -74.0030).daily.data[0]
        parsed_forecast = "*#{forecast.summary}*\n
          *Low:* #{forecast.temperatureLow}°F
          *High:* #{forecast.temperatureHigh}°F\n
          *#{forecast.precipProbability}%* chance of rain"
        client.say(
          channel: data.channel,
          text: parsed_forecast
        )
      end
    end
  end
end
