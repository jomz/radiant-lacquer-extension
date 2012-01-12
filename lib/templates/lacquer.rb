Lacquer.configure do |config|
  config.enable_cache = true
  config.default_ttl = 12.hours
  # Can be :none, :delayed_job, :resque
  config.job_backend = :none
  # Array of Varnish servers to manage
  config.varnish_servers << {
    :host => "127.0.0.1", :port => 6788 # if you have authentication enabled, add :secret => "your secret"
  }

  config.retries = 5
  
  # Varnish 3.X
  config.purge_command = "ban.url"
  config.pass_command = "hit_for_pass"
  # Varnish 2.X
  # config.purge_command = "url.purge"
  # config.pass_command = "pass"

  # Config handler (optional, if you use Hoptoad or another error tracking service)
  # config.command_error_handler = lambda { |s| HoptoadNotifier.notify(s) }
end