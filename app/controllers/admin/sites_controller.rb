class Admin::SitesController < Admin::BaseController
  before_action :set_admin_site, only: [:show, :edit, :update, :destroy]

  # GET /admin/sites
  def index
    authorize Site
    @admin_sites = Site.includes(:user).all
  end

  # GET /admin/sites/1
  def show
    authorize @admin_site
  end

  # GET /admin/sites/new
  def new
    authorize Site
    @admin_site = Site.new
  end

  # GET /admin/sites/1/edit
  def edit
    authorize @admin_site
  end

  # POST /admin/sites
  def create
    authorize Site
    @admin_site = Site.new(permitted_attributes(Site))

    if @admin_site.save
      redirect_to admin_site_path(@admin_site), notice: 'Site 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sites/1
  def update
    authorize @admin_site
    if @admin_site.update(permitted_attributes(@admin_site))
      redirect_to admin_site_path(@admin_site), notice: 'Site 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/sites/1
  def destroy
    authorize @admin_site
    @admin_site.destroy
    redirect_to admin_sites_url, notice: 'Site 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_site
      @admin_site = Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_site_params
    #       #   params.require(:admin_site).permit(policy(@admin_site).permitted_attributes)
    #       # end
end
