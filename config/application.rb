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
      require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
      require 'generators/modulize_template_concern'
      Rails::Generators::ScaffoldControllerGenerator.send :include, Generators::ModulizeTemplateConcern

      require 'generators/rspec/model/model_generator'
      require 'generators/rspec_model_concern'
      Rspec::Generators::ModelGenerator.send :include, Generators::RspecModelConcern

      require 'rails/generators/rails/model/model_generator'
      require 'generators/model_concern'
      Rails::Generators::ModelGenerator.send :include, Generators::ModelConcern
    end
    config.generators do |g|
      # Themeable options
      g.theme_scaffold_mapping = {
        admin: { theme: 'color_admin', theme_scaffold: 'admin' },
        agent: { theme: 'card', theme_scaffold: 'admin' }
      }
      g.test_framework :rspec
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
