class CatalogSerializer < ActiveModel::Serializer
  attributes :id, :name, :children, :settings
  has_many :children

  def settings
    object.features["settings"].join(',') if object.features && object.features["settings"]
  end

  def children
    object.children.map{|c| CatalogSerializer.new(c).as_json }
  end
end
