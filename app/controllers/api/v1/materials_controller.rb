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
    material.features = material.features.merge(params["material"]['features'])
    if flag && material.save
      render json: {status: 'ok', material: material_json(material)}
    else
      render json: {status: 'failed', error_message:  material.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  def batch_create
    authorize Material
    flag, message, materials = parse_material_upload_file
    if flag
      render json: {status: 'ok', materials: material_json(materials)}
    else
      render json: {status: 'failed', error_message:  message }
    end   
  end

  def update
    material = set_material
    authorize material
    material.features = {}
    flag, material = Material::Update.(material, permitted_attributes(material))
    material.features = material.features.merge(params["material"]['features'])
    if flag && material.save
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
      only: %w(id name name_py catalog_id features),
      methods: %w(stock image_item_ids brand price unit vendor_ids),
      include: {
        vendors: { only: %w(id name)},
        catalog: { only: %w(id name features), methods: %w(full_name) },
        image_items: { only: %w(id), methods: %w(image_url image_file_name) },
        material_warehouse_items: { only: %w(stock),
          include: {material_warehouse: {only: %w{name}}}
        }
      }
    )
  end

  def parse_material_upload_file
    require 'roo'
    message = ""
    all_upload = true
    materials = []
    worksheet = nil
    if File.extname(params["file"].path) == ".xlsx"
      worksheet = Roo::Excelx.new(params["file"].path)
    elsif File.extname(params["file"].path) == ".xls"
      worksheet = Roo::Excel.new(params["file"].path)
    elsif File.extname(params["file"].path) == ".csv"
      worksheet = Roo::CSV.new(params["file"].path)
    end 
    # worksheet = Roo::Spreadsheet.open(params["file"].path)
    # ["物料分类", "物料编号", "物料名", "品牌", "价格", "单位", "供应商"]
    if worksheet
      header = worksheet.row(0)
      Material.transaction do
        2.upto worksheet.last_row do |index|
          # .row(index) will return the row which is a subclass of Array
          row = worksheet.row(index)

          attributes = {
            name_py:      row[0],
            name:         row[1],
            catalog_id:   MaterialCatalog.where(name: row[2]).first.try(:id),
            brand:        row[3],
            size:         row[4],
            price:        row[5],
            unit:         row[6],
            texture:      row[7],
            vendor_ids:   Vendor.where(name: row[8]).pluck(:id)
          }

          flag, material = Material::Create.(attributes)
          if flag
            materials.push(material)
          else
            material.errors.messages.each_pair do |k, v|
              message += material.send(k) +':'+ v.join(':')
            end
            all_upload = false
            raise ActiveRecord::Rollback
            break
          end
        end
      end
    else
      all_upload = false
      message = '文件格式不正确！'
    end

    [all_upload, message, materials]
  end

end
