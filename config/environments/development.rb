BallinHipster::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.


  # Required because of epic editor CSS Bugs
  ENV['epic__base_theme'] = "http://localhost:3000/assets/themes/base/epiceditor.css"
  ENV['epic__editor_theme'] = "http://localhost:3000/assets/themes/editor/epic-dark.css"
  ENV['epic__preview_theme'] = "http://localhost:3000/assets/themes/preview/github.css"

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

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.action_controller.action_on_unpermitted_parameters = :raise

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true

  #config.assets.precompile += %w( .svg .eot .woff .ttf ) #added to debug missing glypicons
  #config.assets.paths << Rails.root.join('app', 'assets', 'fonts') #added to debug missing glypicons
end
