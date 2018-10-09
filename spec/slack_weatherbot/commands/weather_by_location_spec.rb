describe SlackWeatherbot::Commands::WeatherTomorrow do
  subject(:app) { SlackWeatherbot::Bot.instance }

  context 'when weather in <location> is sent' do
    it 'returns the current weather in a valid location' do
      VCR.use_cassette('weather_by_location') do
        expect(message: "#{SlackRubyBot.config.user} weather in los angeles")
          .to respond_with_slack_message(/chance of rain/i)
      end
    end

    it 'sends an error for an invalid location' do
      VCR.use_cassette('weather_by_invalid_location') do
        expect(message: "#{SlackRubyBot.config.user} weather in _")
          .to respond_with_slack_message(/Invalid location/i)
      end
    end
  end
end
