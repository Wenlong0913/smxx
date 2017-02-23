class Admin::SitesController < Admin::BaseController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def dashboard 
    authorize Site
  end

  # GET /admin/sites
  def index
    authorize Site
    @sites = Site.all.page(params[:page])
  end

  # GET /admin/sites/1
  def show
    authorize @site
  end

  # GET /admin/sites/new
  def new
    authorize Site
    @site = Site.new
  end

  # GET /admin/sites/1/edit
  def edit
    authorize @site
  end

  # POST /admin/sites
  def create
    authorize Site
    @site = Site.new(permitted_attributes(Site))

    if @site.save
      redirect_to admin_site_path(@site), notice: '经销商 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sites/1
  def update
    authorize @site
    if @site.update(permitted_attributes(@site))
      redirect_to admin_site_path(@site), notice: '经销商 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/sites/1
  def destroy
    authorize @site
    @site.destroy
    redirect_to admin_sites_url, notice: '经销商 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_site_params
    #       #   params.require(:admin_site).permit(policy(@admin_site).permitted_attributes)
    #       # end
end
