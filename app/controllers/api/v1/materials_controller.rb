# 物料

class Api::V1::MaterialsController < Api::V1::BaseController
  before_action :authenticate!

  # 获得物料列表
  # @param [Integer] page 页码
  # @param [Integer] page_size 每页显示数据
  # @return [JSON]
  def index
    authorize Material
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    materials = Material.all.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      materials: material_json(materials),
      page_size: page_size,
      current_page: materials.current_page,
      total_pages: materials.total_pages,
      total_count: materials.total_count
    }
  end

  def create
    authorize Material
    flag, material = Material::Create.(permitted_attributes(Material))
    if flag
      render json: {status: 'ok', material: material}
    else
      render json: {status: 'failed', error_message:  material.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }

    end
  end

  def material_json(materials)
    materials.as_json(only: %w(id name), methods: %w(stock))
  end

end
