module ImageItem
  module Helpers
    def render_image_items(resource, path:)
      if resource.new_record?
        resource_id = ImageItem::Session.create.id
        resource_type = "ImageItem::Session"
      else
        resource_id = resource.id
        resource_type = resource.class.name
      end
      cell(ImageItem::EntryCell, resource, path: image_item_products_path, resource_id: resource_id, resource_type: resource_type).(:add_image_item)
    end
  end
end