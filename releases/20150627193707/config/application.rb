require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LipetskAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom autoloads
    config.autoload_paths += Dir[Rails.root.join('app', 'models', "{**}")]
    #config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru

    config.assets.version = '1.0'
    config.assets.enabled = true
    config.assets.precompile += %w( ckeditor/plugins/**/* ckeditor/skins/moono/* )
    #config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    #config.assets.precompile += %w( admin.css admin.js ckeditor.css )
    #config.assets.precompile += %w( .svg .eot .woff .ttf )

   # Generators
    config.generators do |g|
      g.orm :active_record
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.template_engine :haml
      # g.test_framework :rspec
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.factories_specs false
      g.requests_specs false
      g.routing_specs false
    end
  end
end
