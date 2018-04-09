# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  features   :jsonb
#  is_hot     :boolean          default(FALSE)
#

class MarketCatalog < Catalog
  audited
end
