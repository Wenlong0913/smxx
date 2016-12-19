class CatalogSerializer < ActiveModel::Serializer
  attributes :id, :name, :children
  has_many :children

  def children
    object.children.map{|c| CatalogSerializer.new(c).as_json }
  end
end
