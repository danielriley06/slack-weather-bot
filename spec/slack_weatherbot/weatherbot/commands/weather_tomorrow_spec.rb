describe SlackWeatherbot::Commands::WeatherTomorrow do
  subject(:app) { SlackWeatherbot::Bot.instance }

  context 'when weather now is sent' do
    it 'returns the current weather conditions' do
      VCR.use_cassette('weather_tomorrow') do
        expect(message: "#{SlackRubyBot.config.user} weather tomorrow")
          .to respond_with_slack_message(/chance of rain/i)
      end
    end
  end
end
