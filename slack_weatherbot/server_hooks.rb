module SlackWeatherbot
  class ServerHooks < SlackRubyBot::Server
    on 'hello' do |client, data|
      SlackWeatherbot::Hooks::WeatherUpdateNotification.new.call(client, data)
    end
  end
end
