require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sputnik
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.filter_parameters << :password

    Raven.configure do |config|
      config.dsn = <%= ENV['SENTRY_DSN'] %>
    end
  end
end
