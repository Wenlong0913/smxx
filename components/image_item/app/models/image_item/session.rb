module ImageItem
  class Session < ApplicationRecord
    has_many :image_item_entries_resources, class_name: 'ImageItem::EntriesResource', as: :resource
    has_many :image_items, class_name: 'ImageItem::Entry', :through => :image_item_entries_resources
  end
end
