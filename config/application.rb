require_relative 'boot'

require 'rails'
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Acompanhamento
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale            = 'pt-BR'
    config.time_zone                      = 'America/Sao_Paulo'
    config.active_record.default_timezone = :local

    config.autoload_paths   << "#{Rails.root}/lib"
    config.eager_load_paths << "#{Rails.root}/lib"
  end
end

