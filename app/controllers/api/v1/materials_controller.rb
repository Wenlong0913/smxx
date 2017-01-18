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
    materials = Material.all.page(params[:page] || 1).per(page_size)
    render json: {
      materials: materials.as_json(only: %w(id name), methods: %w(stock)),
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
      render json: {status: 'ok'}
    else
      render json: {status: 'fail'}
    end
  end

end
