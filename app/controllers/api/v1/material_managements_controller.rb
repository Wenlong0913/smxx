# 物料管理

class Api::V1::MaterialManagementsController < Api::V1::BaseController
  before_action :authenticate!

  def create
    authorize MaterialManagement
    flag, material_management = MaterialManagement::Create.(permitted_attributes(MaterialManagement))
    if flag
      render json: {status: 'ok', material: material_management_json(material_management)}
    else
      render json: {status: 'failed', error_message:  material_management.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private
  def material_management_json(material_management)
    material_management.as_json()
  end


end
