module Decorator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      def copy_application_file
        copy_file 'application_decorator.rb', 'app/decorators/application_decorator.rb'
      end
    end
  end
end
