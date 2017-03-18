# == Schema Information
#
# Table name: market_pages
#
#  id                 :integer          not null, primary key
#  site_id            :integer
#  market_template_id :integer
#  name               :string
#  description        :string
#  features           :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class MarketPage <  ApplicationRecord
  audited
  is_impressionable :counter_cache => true

  belongs_to :market_template
  belongs_to :site
  validates_presence_of :name, :site, :market_template
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations

  def value_for(title, *opt)
    self.features[title] if self.features
  end
end
