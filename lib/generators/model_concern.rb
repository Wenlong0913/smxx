# == Usage
# in config/application.rb
# generators do |app|
#   require 'rails/generators/rails/model/model_generator'
#   require 'generators/model_concern'
#   Rails::Generators::ModelGenerator.send :include, Generators::ModelConcern
# end
module Generators
  module ModelConcern
    extend ActiveSupport::Concern

    included do

      def create_model_cuds
        source_paths.push Rails.root.join('lib/templates/rails/model').to_s
        template 'model_create.rb', File.join('app/models/', file_name, 'create.rb').to_s
        template 'model_update.rb', File.join('app/models/', file_name, 'update.rb').to_s
        template 'model_destroy.rb', File.join('app/models/', file_name, 'destroy.rb').to_s
        source_paths.pop
      end

      def add_audited
        return if @behavior == :revoke
        inject_into_class "app/models/#{file_name}.rb", class_name do
          "  audited\n\n"
        end
      end

      def generate_pundit_policy
        invoke 'pundit:policy'
      end

    end

  end
end
