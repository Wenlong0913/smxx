class MaterialOutput < ApplicationRecord
  audited
  has_many :material_output_details
  attr_accessor :material_code, :material_number
  accepts_nested_attributes_for :material_output_details
end
