# csv support
require 'csv'
class Admin::MaterialsController < Admin::BaseController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def dashboard
    authorize Material
  end
  # GET /admin/materials
  def index
    authorize Material
    @filter_colums = %w(id)
    @materials = build_query_filter(Material.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:format] == "json"
        # format.html { send_data(@materials.to_json, filename: "materials-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
        format.json do
          render json: @materials.as_json(only: [:id, :name, :name_py], methods: [:stock, :price])
        end
      elsif params[:xml].present?
        format.html { send_data(@materials.to_xml, filename: "materials-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@materials.as_csv(only: [:id, :name, :name_py, :stock, :price]), filename: "materials-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/materials/1
  def show
    authorize @material
  end

  # GET /admin/materials/new
  def new
    authorize Material
    @material = Material.new
  end

  # GET /admin/materials/1/edit
  def edit
    authorize @material
  end

  # POST /admin/materials
  def create
    authorize Material
    @material = Material.new(permitted_attributes(Material))

    if @material.save
      redirect_to admin_material_path(@material), notice: 'Material 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/materials/1
  def update
    authorize @material
    if @material.update(permitted_attributes(@material))
      redirect_to admin_material_path(@material), notice: 'Material 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/materials/1
  def destroy
    authorize @material
    @material.destroy
    redirect_to admin_materials_url, notice: 'Material 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_material_params
    #       #   params.require(:admin_material).permit(policy(@admin_material).permitted_attributes)
    #       # end
end
