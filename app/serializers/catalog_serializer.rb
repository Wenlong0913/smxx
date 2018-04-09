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

class CatalogSerializer < ActiveModel::Serializer
  attributes :id, :name, :children, :settings, :icon_url, :is_hot
  has_many :children

  def settings
    object.features["settings"].join(',') if object.features && object.features["settings"]
  end

  def children
    object.children.map{|c| CatalogSerializer.new(c).as_json }
  end
end
