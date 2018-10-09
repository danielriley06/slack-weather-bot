ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']
require 'dotenv/load'
require 'rufus-scheduler'

ForecastIO.api_key = ENV['DARKSKY_API_TOKEN']

require 'slack-ruby-bot'
require 'slack_weatherbot/commands/weather_now'
require 'slack_weatherbot/commands/weather_tomorrow'
require 'slack_weatherbot/commands/weather_by_location'
require 'slack_weatherbot/hooks/weather_update_notification'
require 'slack_weatherbot/bot'
require 'slack_weatherbot/scheduler'
require 'slack_weatherbot/server_hooks'
require 'slack_weatherbot/utils/forecast'
require 'slack_weatherbot/utils/format_message'
