# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  name       :string
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  name_py    :string
#  catalog_id :integer
#

class Product < Item
  acts_as_taggable
  store_accessor :features, :price, :unit, :stock, :description, :content, :discount, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee, :hot, :recommend, :event, :promotion, :discount
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :sales_distribution_resources, class_name: 'SalesDistribution::Resource', as: 'object'
  has_many_favorites
  belongs_to :catalog
  belongs_to :site
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  before_save do
    self.price = price.to_f.round(2)
    self.discount = (discount.to_f == 0 || discount.to_f > price.to_f ) ? price.to_f.round(2) : discount.to_f.round(2)
    self.weight = weight.to_f.round(2)
    self.stock = stock.to_i
  end

end
