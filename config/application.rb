require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LocaltradeApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # This also configures session_options for use below
    # config.session_store :cookie_store, secure: true, same_site: :none #, key: '_localtrade', same_site: :none, secure: true

    # Required for all session management (regardless of session_store)
    # config.middleware.use ActionDispatch::Cookies

    # config.middleware.use config.session_store, config.session_options

    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore, key: '_localtrade', same_site: :none #, secure: true
    # config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, key: '_localtrade')
  end
end
