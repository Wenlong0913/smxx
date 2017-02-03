# 物料仓库

class Api::V1::MaterialWarehousesController < Api::V1::BaseController
  before_action :authenticate!

  # 获得物料列表
  # @return [JSON]
  def index
    authorize MaterialWarehouse
    material_warehouses = MaterialWarehouse.all.where(site_id: params["site_id"]).order(created_at: :desc)
    render json: {
      material_warehouses: material_warehouse_json(material_warehouses)
    }
  end


  private

  def material_warehouse_json(material_warehouses)
    material_warehouses.as_json(only: %w(id name))
  end

end
