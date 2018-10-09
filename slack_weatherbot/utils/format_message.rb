module SlackWeatherbot
  module Utils
    module FormatMessage
      def self.attachment(forecast:)
        weather_data = forecast.daily.data[0]
        [
          fallback: weather_data.summary.to_s,
          pretext: 'Weather update!',
          color: '#36a64f',
          title: weather_data.summary.to_s,
          fields: [
            {
              title: 'Temperature',
              value: "_Low:_ #{weather_data.temperatureLow}°F _High:_ #{weather_data.temperatureHigh}°F",
              short: true
            },
            {
              title: 'Precipitation',
              value: "*#{weather_data.precipProbability}%* chance of rain",
              short: true
            }
          ],
          actions: [
            {
              type: 'button',
              text: 'View on Dark Sky :cloud:',
              url: "https://darksky.net/forecast/#{forecast.latitude},#{forecast.longitude}"
            }
          ]
        ]
      end
    end
  end
end
