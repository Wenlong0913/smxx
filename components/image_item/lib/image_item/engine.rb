module ImageItem
  class Engine < ::Rails::Engine
    isolate_namespace ImageItem
    require 'cells'
    require 'cells-rails'
    require 'cells-slim'

    require 'image_item/helpers'
    require 'image_item/routes'
    require "image_item/acts_as_imageable"
    require "image_item/has_many_image_items"
    config.cells.with_assets = ["image_item/base_cell"]
    initializer "image_item.initialize" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, ImageItem::ActsAsImageable)
      end
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, ImageItem::HasManyImageItems
      end
    end
  end
end
