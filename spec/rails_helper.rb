ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'

if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start 'rails' do
    add_filter do |source_file|
      source_file.lines.count < 5
    end
  end
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.javascript_driver = :poltergeist

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.before(:each, js: true) do
    default_url_options[:host] = 'localhost:3000'
  end
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
