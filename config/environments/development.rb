Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  ## Paperclip configuration
  # config.paperclip_defaults = {
  #   storage: :s3,
  #   s3_protocol: :https,
  #   s3_host_alias: "s3-sa-east-1.amazonaws.com/orangetuescuela.com",
  #   s3_credentials: {
  #     bucket: ENV['AWS_S3_BUCKET'],
  #     access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  #     secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  #     s3_region: ENV['AWS_REGION']
  #   }
  # }
  ## Mailer configuration
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mailgun.org",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :authentication => :plain, # Mandrill supports 'plain' or 'login'
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => ENV['MAILGUN_SMTP_USER'], #postmaster@mg.2brains.cl
    :password  => ENV['MAILGUN_SMTP_PASS'], # SMTP password is any valid API key
    #:domain => '2brains.cl', # your domain to identify your server when connecting
  }
end
