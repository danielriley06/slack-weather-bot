describe SlackWeatherbot::Hooks::WeatherUpdateNotification do
  subject(:app) { SlackWeatherbot::Bot.instance }

  context 'when app is started' do
    it 'creates a scheduled weather update task' do
      expect(app.hooks.handlers).to have_key(:message)
    end
  end
end
