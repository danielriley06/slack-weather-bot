describe SlackWeatherbot::Commands::WeatherNow do
  subject(:app) { SlackWeatherbot::Bot.instance }

  context 'when weather now is sent' do
    it 'returns the current weather conditions' do
      VCR.use_cassette('current_weather') do
        expect(message: "#{SlackRubyBot.config.user} weather now")
          .to respond_with_slack_message(/Current Temp:/i)
      end
    end
  end
end
