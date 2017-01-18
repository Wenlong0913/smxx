# 物料管理

class Api::V1::MaterialManagementsController < Api::V1::BaseController
  before_action :authenticate!

  # 获得物料出库／入库列表
  # @param [String] operate_type 操作类型(input/ouput)
  # @param [Integer] page 页码
  # @param [Integer] page_size 每页显示数据
  # @return [JSON]
  def index
    authorize MaterialManagement
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    operate_type = set_operate_type
    material_managements = MaterialManagement.where(operate_type: set_operate_type).page(params[:page] || 1).per(page_size)
    render json: {
      materials: material_management_json(material_managements)
      page_size: page_size,
      current_page: material_managements.current_page,
      total_pages: material_managements.total_pages,
      total_count: material_managements.total_count
    }
  end

  def create
  end

  private
  def set_operate_type
    if ['input', 'output'].include?(params["operate_type"])
      params['operate_type']
    else
      raise 'unknow operate type'
    end
  end

  def material_management_json(material_managements)
    material_managements.as_json(
      only: %w(id note operate_date operate_type), 
      include: {
        material_management_details: {
          only: %w(id number price), 
          include: {
            material: {only: %w(id name)}
          }
        }
      }
    )
  end


end
