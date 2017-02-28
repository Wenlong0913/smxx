class OrderCv < ApplicationRecord
  audited
  store_accessor :features, :width, :height, :depth, :component_name, :component_length, :component_width, :component_depth, :material_name, :material_type, :code, :amount, :unit

  belongs_to :order
end
