# == Usage
# in config/application.rb
# generators do |app|
#   require 'generators/rspec/model/model_generator'
#   require 'generators/rspec_model_concern'
#   Rails::Generators::ScaffoldControllerGenerator.send :include, Generators::RspecModelConcern
# end
module Generators
  module RspecModelConcern
    extend ActiveSupport::Concern

    included do
      def create_model_cud_specs
        template 'model_create_spec.rb', File.join('spec/models/', file_name, 'create_spec.rb').to_s
        template 'model_update_spec.rb', File.join('spec/models/', file_name, 'update_spec.rb').to_s
        template 'model_destroy_spec.rb', File.join('spec/models/', file_name, 'destroy_spec.rb').to_s
      end

    end

  end
end
