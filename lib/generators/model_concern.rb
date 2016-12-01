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
      def add_audited
        return if @behavior == :revoke
        inject_into_class "app/models/#{file_name}.rb", class_name do
          "  audited\n\n"
        end
      end
    end
  end
end
