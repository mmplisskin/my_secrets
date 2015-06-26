# Amount of unicorn workers to spin up
worker_processes 3

# How long to wait before killing an unresponsive worker
timeout 30

# Load the app before spawning workers - this makes newrelic work properly
preload_app true

@sidekiq_pid = nil
# Uncomment next line if using clockwork gem:
# @clock_pid = nil

before_fork do |server, worker|
  # Spawn a SideKiq process
  # Set concurrency to 2 - so it doesn't max out the 10 connection limit on
  # Heroku's redis-to-go nano. Can bump this up if on full redis plan.
  @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")

  # Spawn a Clockwork clock/scheduler process (clockwork gem)
  # Uncomment next line if using clockwork gem:
  # @clock_pid ||= spawn("bundle exec clockwork app/clock.rb")

  sleep 1

end

after_fork do |server, worker|
  Sidekiq.configure_client do |config|
    config.redis = { :size => 1 }
  end
  Sidekiq.configure_server do |config|
    config.redis = { :size => 5 }
  end
end
