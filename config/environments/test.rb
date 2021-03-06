Rails.application.configure do
  config.middleware.use Clearance::BackDoor
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }
  config.action_mailer.default_url_options          = { host: 'localhost:3000' }
  config.cache_classes                              = true
  config.eager_load                                 = false
  config.public_file_server.enabled                 = false
  config.consider_all_requests_local                = true
  config.action_controller.perform_caching          = false
  config.action_dispatch.show_exceptions            = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching              = false
  config.action_mailer.delivery_method              = :test
  config.active_support.deprecation                 = :stderr
end
