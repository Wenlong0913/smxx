# csv support
require 'csv'
class Admin::MaterialManagementsController < Admin::BaseController
  before_action :set_material_management, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: [:index,:new]
  # GET /admin/material_managements
  def index
    authorize MaterialManagement
    @filter_colums = %w(id)
    return redirect_to admin_root_path, alert: "访问的页面不存在" unless @type
    @material_managements = build_query_filter(MaterialManagement.all.send(@type), only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@material_managements.to_json, filename: "material_managements-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@material_managements.to_xml, filename: "material_managements-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@material_managements.as_csv(only: []), filename: "material_managements-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/material_managements/1
  def show
    authorize @material_management
  end

  # GET /admin/material_managements/new
  def new
    authorize MaterialManagement
    @material_management = MaterialManagement.new(operate_type: @type)
  end

  # GET /admin/material_managements/1/edit
  def edit
    authorize @material_management
  end

  # POST /admin/material_managements
  def create
    authorize MaterialManagement
    flag, @material_management = MaterialManagement::Create.(permitted_attributes(MaterialManagement))

    if flag
      redirect_to admin_material_management_path(@material_management), notice: "#{MaterialManagement.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/material_managements/1
  def update
    authorize @material_management
    flag, @material_management = MaterialManagement::Update.(@material_management, permitted_attributes(MaterialManagement))
    if @material_management.update(permitted_attributes(@material_management))
      redirect_to admin_material_management_path(@material_management), notice: "#{MaterialManagement.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/material_managements/1
  def destroy
    authorize @material_management
    @material_management.destroy
    redirect_to admin_material_managements_url, notice: "#{MaterialManagement.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_management
      @material_management = MaterialManagement.find(params[:id])
    end

    def set_type
      @type = nil
      if ['output', 'input'].include?(params[:type])
        @type = params[:type]
      end
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_material_management_params
    #       #   params.require(:admin_material_management).permit(policy(@admin_material_management).permitted_attributes)
    #       # end
end
