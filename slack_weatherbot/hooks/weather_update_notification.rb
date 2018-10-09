module SlackWeatherbot
  module Hooks
    # Schedules a daily cron job to notify all channels the SlackWeatherbot
    # is invited to of significant weather changes
    class WeatherUpdateNotification
      def call(_client, _data)
        schedule_weather_notifications
      end

      private

      def schedule_weather_notifications
        SlackWeatherbot.scheduler.in('3s', tag: 'Daily Weather Notification Job') do
          send_weather_notifications_on_change
        end
        ap Bot.joined_channel_id_array
        # scheduler.cron '00 09 * * *' do
        #   check_weather_changes
        # end
      end

      def send_weather_notifications_on_change
        current_weather_data = SlackWeatherbot::Utils::Forecast.new.call
        if check_weather_changes(current_weather_data: current_weather_data)
          send_weather_notifications(current_weather_data: current_weather_data)
        end
      end

      def check_weather_changes(current_weather_data:)
        significant_changes = false
        previous_day_date = Time.now + 1.day
        previous_day_forecast = SlackWeatherbot::Utils::Forecast.new(
          time: previous_day_date.to_i
        ).call
        precip_change = current_weather_data.currently.precipProbability == previous_day_forecast.currently.precipProbability
        significant_changes = true unless precip_change
        significant_changes
      end

      def send_weather_notifications(current_weather_data:)
        formatted_attachment = SlackWeatherbot::Utils::FormatMessage.attachment(
          forecast: current_weather_data
        )
        Bot.joined_channel_id_array.each do |channel_id|
          Bot.slack_client.chat_postMessage(
            channel: channel_id,
            attachments: formatted_attachment,
            as_user: true
          )
        end
      end
    end
  end
end
