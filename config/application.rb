require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Tutu
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ru

    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "14be132d-0919-4508-bf17-0cbc12af7831" }
  end
end
