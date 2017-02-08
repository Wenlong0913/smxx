# 物料

class Api::V1::MaterialsController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_order, only: [:index]
  # 获得物料列表
  # @param [Integer] page 页码
  # @param [Integer] page_size 每页显示数据
  # @return [JSON]
  def index
    authorize Material
    if params[:order_id].present?
      materials = @order.materials.order(created_at: :desc)
      render json: {materials: materials}
    else
      page_size = params[:page_size].present? ? params[:page_size].to_i : 20
      materials = params['search_content'].present? ? Material.where("name_py like :key OR name like :key", {key: ['%',params['search_content'].upcase, '%'].join}) : Material.all
      materials = materials.order(created_at: :desc).page(params[:page] || 1).per(page_size)
      render json: {
        materials: material_json(materials),
        page_size: page_size,
        current_page: materials.current_page,
        total_pages: materials.total_pages,
        total_count: materials.total_count
      }
    end
  end

  def create
    authorize Material
    flag, material = Material::Create.(permitted_attributes(Material))
    if flag
      render json: {status: 'ok', material: material_json(material)}
    else
      render json: {status: 'failed', error_message:  material.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  def update
    material = set_material
    authorize material
    flag, material = Material::Update.(material, permitted_attributes(material))
    if flag
      render json: {status: 'ok', material: material_json(material)}
    else
      render json: {status: 'failed', error_message:  material.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private

  def set_order
    @order = Order.where(id: params[:order_id]).first if params[:order_id].present?
  end

  def set_material
    Material.find_by_id(params[:id])
  end

  def material_json(materials)
    materials.as_json(
      only: %w(id name name_py catalog_id),
      methods: %w(stock image_item_ids brand color size texture price unit vendor_ids),
      include: {
        vendors: { only: %w(id name)},
        catalog: { only: %w(id name), methods: %w(full_name) },
        image_items: { only: %w(id), methods: %w(image_url image_file_name) },
        material_warehouse_items: { only: %w(stock),
          include: {material_warehouse: {only: %w{name}}}
        }
      }
    )
  end

end
