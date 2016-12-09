require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tmf
  class Application < Rails::Application
    require 'settings'
    generators do |app|

      require 'rails/generators/base'
      require 'generators/base_concern'
      Rails::Generators::Base.send :include, Generators::BaseConcern

      require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
      require 'generators/modulize_template_concern'
      Rails::Generators::ScaffoldControllerGenerator.send :include, Generators::ModulizeTemplateConcern

      require 'rails/generators/rails/model/model_generator'
      Rails::Generators::ModelGenerator.hook_for :cud, default: true
      Rails::Generators::ModelGenerator.hook_for :audited, default: true, as: 'model'
      Rails::Generators::ModelGenerator.hook_for :pundit, default: true, as: 'policy', in: 'pundit'
    end
    config.generators do |g|
      # Themeable options
      g.theme_scaffold_mapping = {
        admin: { theme: 'color_admin', theme_scaffold: 'admin' },
        agent: { theme: 'card', theme_scaffold: 'admin' }
      }
      g.test_framework :rspec
      g.scaffold_stylesheet false # don't generate app/assets/stylesheets/scaffolds.scss
    end

    I18n.config.enforce_available_locales = false

    config.i18n.available_locales = ["zh-CN"]
    config.i18n.default_locale = "zh-CN".to_sym
    config.before_configuration do
      I18n.locale = "zh-CN".to_sym
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
      I18n.reload!
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
