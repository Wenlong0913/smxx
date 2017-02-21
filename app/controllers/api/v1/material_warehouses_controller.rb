# 物料仓库

class Api::V1::MaterialWarehousesController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_material_warehouses

  # 获得物料仓库列表
  # @return [JSON]
  def index
    authorize MaterialWarehouse
    material_warehouses = @material_warehouses.where(site_id: params["site_id"]).order(created_at: :desc)
    render json: {
      material_warehouses: material_warehouse_json(material_warehouses)
    }
  end

  def create
    authorize MaterialWarehouse
    flag, material_warehouse = MaterialWarehouse::Create.(permitted_attributes(MaterialWarehouse))
    if flag
      render json: {status: 'ok', material_warehouse: material_warehouse_json(material_warehouse)}
    else
      render json: {status: 'failed', error_message:  material_warehouse.errors.full_messages.join(', ') }
    end
  end

  private

  def material_warehouse_json(material_warehouses)
    material_warehouses.as_json(only: %w(id name), methods: %w(phone warehouse_address warehouse_user))
  end

end
