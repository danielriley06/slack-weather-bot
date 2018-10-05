ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

require 'slack-ruby-bot'
require 'slack_weatherbot/bot'
require 'slack_weatherbot/commands/weather_now'
require 'slack_weatherbot/commands/weather_tomorrow'
