require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ocazia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #

    config.generators do |g|
      # g.test_framework :rspec, fixture: true, views: false
      # g.integration_tool :rspec, fixture: true, views: false
      # g.javascript_engine :coffee
      # g.orm :active_record
      # g.stylesheet_engine :scss
      g.template_engine :slim
      g.helper = false
      g.stylesheets = false
      g.javascripts = false
    end
  end
end
