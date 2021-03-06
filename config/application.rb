require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # config.middleware.use Apartment::Elevators::Subdomain
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.session_store :cookie_store, :key => '_domain_session', :domain => :all
    config.filestack_rails.api_key = 'A00aKRuy5Sj2VJTCVm8Koz'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
