module Decorator
  class Railtie < ::Rails::Railtie

    initializer 'decorator' do
      ActiveSupport.on_load(:action_controller) do
        require_relative 'helpers'
        ActionController::Base.helper Decorator::Helpers
      end
      ActiveSupport.on_load(:action_record) do
        require_relative 'model_concern'
        ActiveRecord::Base.send(:include, Decorator::ModelConcern)
      end
    end

    generators do |app|
      require 'rails/generators/rails/model/model_generator'
      Rails::Generators::ModelGenerator.hook_for :decorator, default: 'decorator'
    end
  end
end
