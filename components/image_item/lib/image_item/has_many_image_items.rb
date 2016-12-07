module ImageItem
  module HasManyImageItems
    extend ActiveSupport::Concern

    class_methods do
      def has_many_image_items
        has_many :image_item_entries_resources, class_name: 'ImageItem::EntriesResource', as: :resource, autosave: true
        has_many :image_items, class_name: 'ImageItem::Entry', :through => :image_item_entries_resources
      end
    end
  end
end