class MaterialManagement < ApplicationRecord
  audited
  has_many :material_management_details, dependent: :destroy
  accepts_nested_attributes_for :material_management_details
  belongs_to :material_warehouse
  enum operate_type: [:output, :input]

  before_save -> { self.operate_date = Date.today if self.operate_date.blank? }
  after_create :update_order_material

  def update_order_material
    if order_code
      order = Order.find_by(code: order_code)
      if order
        material_management_details.each do |mmd|
          order_material = order.order_materials.where(material_id: mmd.material_id).first
          if order_material
            if operate_type == 'input'
              order_material.practical_number = order_material.practical_number.to_i - mmd.number
            else
              order_material.practical_number = order_material.practical_number.to_i + mmd.number
            end
            order_material.save!
          end
        end
      end
    end
  end
end
