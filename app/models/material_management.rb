class MaterialManagement < ApplicationRecord
  audited
  has_many :material_management_details, dependent: :destroy
  accepts_nested_attributes_for :material_management_details
  belongs_to :material_warehouse
  enum operate_type: [:output, :input]

  def material_warehouse_name
    material_warehouse.try(:name)
  end
end
