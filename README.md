# SlackWeatherbot

This is a Slack Bot for interacting with Darksky. It's built on the [Slack-Ruby-Bot](https://github.com/slack-ruby/slack-ruby-bot/) framework.

## Usage

After you've [registered your bot](https://github.com/slack-ruby/slack-ruby-bot/blob/4c9e0b8b34b7fbac56960ebd742ec594be35bbee/DEPLOYMENT.md) in Slack, to test the Weatherbot, you'll need to copy the `.env.example` file to `.env` and update the variables for your preferences.

If you want to just run the bot outside of a container, you can use [Foreman](https://github.com/theforeman/foreman)

    $ bundle exec foreman start

## Required variables

The following environment variables are required for SlackWeatherbot to work:

| Variable          | Description                              |
| ----------------- | ---------------------------------------- |
| SLACK_API_TOKEN   | Token for interacting with the Slack API |
| DARKSKY_API_TOKEN | Your Victorops user's API ID             |

## Testing

SlackVictorbot uses a test harness wired with [RSpec](https://github.com/rspec/rspec).

To run the specs, you can either run them directly from your machine.

### From your machine

    # Install the dependencies
    $ bundle Install

    # Run the specs
    $ bundle exec rspec specs

## Deployment

SlackWeatherbot can be deployed as a normal Ruby application or in a containerized environment. The biggest thing to ensure is that the environment variables listed above are available when the application or container is started.
