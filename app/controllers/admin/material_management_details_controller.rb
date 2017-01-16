# csv support
require 'csv'
class Admin::MaterialManagementDetailsController < Admin::BaseController
  before_action :set_material_management_detail, only: [:show, :edit, :update, :destroy]

  # GET /admin/material_management_details
  def index
    authorize MaterialManagementDetail
    @filter_colums = %w(id)
    @material_management_details = build_query_filter(MaterialManagementDetail.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@material_management_details.to_json, filename: "material_management_details-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@material_management_details.to_xml, filename: "material_management_details-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@material_management_details.as_csv(only: []), filename: "material_management_details-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/material_management_details/1
  def show
    authorize @material_management_detail
  end

  # GET /admin/material_management_details/new
  def new
    authorize MaterialManagementDetail
    @material_management_detail = MaterialManagementDetail.new
  end

  # GET /admin/material_management_details/1/edit
  def edit
    authorize @material_management_detail
  end

  # POST /admin/material_management_details
  def create
    authorize MaterialManagementDetail
    @material_management_detail = MaterialManagementDetail.new(permitted_attributes(MaterialManagementDetail))

    if @material_management_detail.save
      redirect_to admin_material_management_detail_path(@material_management_detail), notice: "#{MaterialManagementDetail.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/material_management_details/1
  def update
    authorize @material_management_detail
    if @material_management_detail.update(permitted_attributes(@material_management_detail))
      redirect_to admin_material_management_detail_path(@material_management_detail), notice: "#{MaterialManagementDetail.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/material_management_details/1
  def destroy
    authorize @material_management_detail
    @material_management_detail.destroy
    redirect_to admin_material_management_details_url, notice: "#{MaterialManagementDetail.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_management_detail
      @material_management_detail = MaterialManagementDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_material_management_detail_params
    #       #   params[:admin_material_management_detail]
    #       # end
end
