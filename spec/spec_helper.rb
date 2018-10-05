$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

require 'slack-ruby-bot/rspec'
require 'dotenv/load'

ENV['RACK_ENV'] = 'test'

require 'slack_weatherbot'

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].each do |file|
  require file
end

RSpec.configure do |config|
  config.before(:each) do
    ForecastIO.api_key = ENV['DARKSKY_API_TOKEN']
  end
end
