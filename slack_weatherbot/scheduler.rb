# Adds scheduler instance to SlackWeatherbot
module SlackWeatherbot
  def self.scheduler
    @scheduler ||= Rufus::Scheduler.new
  end
end
