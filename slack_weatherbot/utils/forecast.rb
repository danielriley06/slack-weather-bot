module SlackWeatherbot
  module Utils
    class Forecast
      attr_reader :latitude, :longitude, :time

      def initialize(latitude: 40.7233, longitude: -74.0030, time: Time.now)
        @latitude = latitude
        @longitude = longitude
        @time = time.to_i
      end

      def call
        fetch_weather_forecast_object
      end

      private

      def fetch_weather_forecast_object
        ForecastIO.forecast(
          latitude, longitude, time: time, params: { exclude: 'hourly' }
        )
      end
    end
  end
end
