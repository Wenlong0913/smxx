# == Usage
# in config/application.rb
# generators do |app|
#   require 'rails/generators/base'
#   require 'generators/base_concern'
#   Rails::Generators::Base.send :include, Generators::BaseConcern
# end
module Generators
  module BaseConcern
    def remove_ar_module(class_name, origin_class_name = class_name)
      klass = class_name.constantize rescue Object
      return class_name if klass < ActiveRecord::Base
      folders = class_name.split('::')
      folders.shift
      return origin_class_name if folders.size == 0
      remove_ar_module(folders.join('::'), origin_class_name)
    end
  end
end
