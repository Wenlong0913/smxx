class CatalogSerializer < ActiveModel::Serializer
  attributes :id, :name, :children
  has_many :children
end
