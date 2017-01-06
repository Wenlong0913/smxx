class MaterialManagement < ApplicationRecord
  audited
  has_many :material_management_details
  accepts_nested_attributes_for :material_management_details
  enum operate_type: [:output, :input]
end
