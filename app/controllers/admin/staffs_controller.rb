# csv support
require 'csv'
class Admin::StaffsController < Admin::BaseController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_site, only: [:show, :edit, :update, :destroy, :new, :index, :create]

  # GET /admin/staffs
  def index
    authorize Staff
    @filter_colums = %w(id)
    @staffs = build_query_filter(@site.staffs, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@staffs.to_json, filename: "staffs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@staffs.to_xml, filename: "staffs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@staffs.as_csv(only: []), filename: "staffs-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/staffs/1
  def show
    authorize @staff
  end

  # GET /admin/staffs/new
  def new
    authorize Staff
    @staff = @site.staffs.new
  end

  # GET /admin/staffs/1/edit
  def edit
    authorize @staff
  end

  # POST /admin/staffs
  def create
    authorize Staff
    @staff = @site.staffs.new(permitted_attributes(Staff))
    
    if @staff.save
      redirect_to admin_site_staff_path(@site, @staff), notice: "美容师 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/staffs/1
  def update
    authorize @staff
    if @staff.update(permitted_attributes(@staff))
      redirect_to admin_site_staff_path(@site, @staff), notice: "美容师 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/staffs/1
  def destroy
    authorize @staff
    @staff.destroy
    redirect_to admin_site_staffs_url(@site), notice: "美容师 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_staff_params
    #       #   params[:admin_staff]
    #       # end
end
