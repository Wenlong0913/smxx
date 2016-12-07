module ImageItem
  class EntriesResource < ApplicationRecord
    belongs_to :image_item, class_name: 'ImageItem::Entry', foreign_key: :image_item_entry_id
    belongs_to :resource, polymorphic: true
  end
end
 