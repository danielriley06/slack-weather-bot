module SlackWeatherbot
  class Bot < SlackRubyBot::Bot
    def self.slack_client
      @slack_client ||= ::Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
    end

    def self.joined_channel_id_array
      slack_client.channels_list.channels.map!(&:id).to_a
    end

    help do
      title 'SlackWeatherbot'
      desc 'Interface with Darksky from Slack'

      command 'weather now' do
        desc 'Gives you your current weather information'
      end

      command 'weather tomorrow' do
        desc "Gives you tomorrow's forecast"
      end

      command 'weather in <location>' do
        desc "Gives you the forecast for any location's city, state, zip (e.g. los angeles, omaha NE, 07040, etc.)"
      end
    end
  end
end
