# csv support
require 'csv'
class Admin::MaterialOutputsController < Admin::BaseController
  before_action :set_material_output, only: [:show, :edit, :update, :destroy]

  # GET /admin/material_outputs
  def index
    authorize MaterialOutput
    @filter_colums = %w(id)
    @material_outputs = build_query_filter(MaterialOutput.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@material_outputs.to_json, filename: "material_outputs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@material_outputs.to_xml, filename: "material_outputs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@material_outputs.as_csv(only: []), filename: "material_outputs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/material_outputs/1
  def show
    authorize @material_output
  end

  # GET /admin/material_outputs/new
  def new
    authorize MaterialOutput
    @material_output = MaterialOutput.new
  end

  # GET /admin/material_outputs/1/edit
  def edit
    authorize @material_output
  end

  # POST /admin/material_outputs
  def create
    binding.pry
    authorize MaterialOutput
    flag,  @material_output = MaterialOutput::Create.(permitted_attributes(MaterialOutput))
    if flag
      redirect_to admin_material_output_path(@material_output), notice: "#{MaterialOutput.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/material_outputs/1
  def update
    authorize @material_output
    flag,  @material_output = MaterialOutput::Update.(@material_output, permitted_attributes(MaterialOutput))
    if flag
      redirect_to admin_material_output_path(@material_output), notice: "#{MaterialOutput.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/material_outputs/1
  def destroy
    authorize @material_output
    @material_output.destroy
    redirect_to admin_material_outputs_url, notice: "#{MaterialOutput.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_output
      @material_output = MaterialOutput.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_material_output_params
    #       #   params[:admin_material_output]
    #       # end
end
