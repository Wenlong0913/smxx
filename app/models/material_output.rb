class MaterialOutput < ApplicationRecord
  audited
  has_many :material_output_details
  accepts_nested_attributes_for :material_output_details
end
