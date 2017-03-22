class Shop < ApplicationRecord
  store_accessor :features, :business_time, :address
  audited
  is_impressionable :counter_cache => true

  PROPERTIES = {
    recommend: "推荐",
    event: "活动",
    promotion: "促销",
    discount: "折扣"
  }

  belongs_to :user
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
end
