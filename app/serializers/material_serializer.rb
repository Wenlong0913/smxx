class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :price, :stock, :name, :name_py
end
