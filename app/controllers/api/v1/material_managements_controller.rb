# 物料管理

class Api::V1::MaterialManagementsController < Api::V1::BaseController
  before_action :authenticate!

  def create
    authorize MaterialManagement
    flag, material_management = MaterialManagement::Create.(permitted_attributes(MaterialManagement))
    if flag
      render json: {status: 'ok', material_management_details: material_management_detail_json(material_management.material_management_details)}
    else
      render json: {status: 'failed', error_message:  material_management.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private

  def material_management_detail_json(material_management_details)
    material_management_details.as_json(
      only: %w(id number),
      include: {
        material_management: { 
          only: %w(id operate_date operate_type),
          include: {material_warehouse: {only: %w(id name)}}
        },
        material: {only: %w(id name)}
      }
    )
  end

end
