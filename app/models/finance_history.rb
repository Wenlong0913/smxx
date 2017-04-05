class FinanceHistory < ApplicationRecord
  audited
  belongs_to :owner, polymorphic: true
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  store_accessor :features, :note

  enum operate_type: {
    in:  0, #收款
    out: 1 #付款
  }

  def image_url
    image_items.first.try(:image_url)
  end
  
end
