WebshopFive::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # Code is not reloaded between requests.
  config.cache_classes = true
  # Eager load code on boot. This eager loads most of Rails and
   config.eager_load = true
  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  # Set to :debug to see everything in the log.
  config.log_level = :info

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  config.assets.raise_runtime_errors = true

  config.action_mailer.perform_deliveries = true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :user_name            => ENV["SENDGRID_USERNAME"],
  :password             => ENV["SENDGRID_PASSWORD"],
  :authentication       => 'plain',
  :enable_starttls_auto => true  }


  #config.action_mailer.perform_deliveries = true

  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.smtp_settings = {
  #:address              => "smtp.gmail.com",
  #:port                 => 587,
  #:user_name            => ENV["GMAIL_USERNAME"],
  #:password             => ENV["GMAIL_PASSWORD"],
  #:authentication       => 'plain',
  #:enable_starttls_auto => true  }

end
