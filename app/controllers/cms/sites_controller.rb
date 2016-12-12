class Cms::SitesController < Admin::BaseController
  before_action :set_cms_site, only: [:show, :edit, :update, :destroy]

  def index
    authorize Cms::Site
    @cms_sites = Cms::Site.all
    respond_to do |format|
      format.html
      format.json { render json: @cms_sites }
    end
  end

  def show
    authorize @cms_site
    @cms_channels = @cms_site.channels.where("parent_id is null")
    respond_to do |format|
      format.html
      format.json { render json: @cms_site }
    end
  end

  def new
    authorize Cms::Site
    @cms_site = Cms::Site.new
  end

  def edit
    authorize @cms_site
  end

  def create
    authorize Cms::Site
    @cms_site = Cms::Site.new(permitted_attributes(Cms::Site))

    respond_to do |format|
      format.html do
        if @cms_site.save
          redirect_to cms_site_path(@cms_site), notice: 'Site 创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @cms_site }
    end

  end

  def update
    authorize @cms_site
    respond_to do |format|
      format.html do
        if @cms_site.update(permitted_attributes(@cms_site))
          redirect_to cms_site_path(@cms_site), notice: 'Site 更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @cms_site }
    end
  end

  def destroy
    authorize @cms_site
    @cms_site.destroy
    respond_to do |format|
      format.html { redirect_to cms_sites_url, notice: 'Site 删除成功.' }
      format.json { head 200 }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cms_site
      @cms_site = Cms::Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def cms_site_params
    #       #   params.require(:cms_site).permit(:name, :template, :domain, :description, :is_published)
    #       # end
end
