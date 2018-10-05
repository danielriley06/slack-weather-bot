$LOAD_PATH.unshift File.dirname(__FILE__)

require 'puma'
require 'dotenv/load'
require 'slack_weatherbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackWeatherbot::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackWeatherbot::Web
