describe SlackWeatherbot::Bot do
  subject(:app) { SlackWeatherbot::Bot.instance }

  it_behaves_like 'a slack ruby bot'
end
