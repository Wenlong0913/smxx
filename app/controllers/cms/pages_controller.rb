class Cms::PagesController < Cms::BaseController
  before_action :set_cms_site_and_channel
  before_action :set_cms_page, only: [:show, :edit, :update, :destroy]

  def index
    @cms_pages = Cms::Page.joins(:channel).where("cms_channels.site_id = ?", @cms_site.id).page(params[:page])
    authorize @cms_pages
    respond_to do |format|
      format.html
      format.json { render json: @cms_pages }
    end
  end

  def show
    authorize @cms_page
    respond_to do |format|
      format.html
      format.json { render json: @cms_page }
    end
  end

  def new
    @cms_page = @cms_channel.pages.new
    authorize @cms_page
  end

  def edit
    authorize @cms_page
  end

  def create
    @cms_page = @cms_channel.pages.new(permitted_attributes(@cms_channel.pages))
    authorize @cms_page
    respond_to do |format|
      format.html do
        if @cms_page.save
          redirect_to cms_site_pages_path(@cms_site), notice: '创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @cms_page }
    end

  end

  def update
    authorize @cms_page
    respond_to do |format|
      format.html do
        if @cms_page.update(permitted_attributes(@cms_page))
          redirect_to cms_site_pages_path(@cms_site), notice: ' 更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @cms_page }
    end
  end

  def destroy
    authorize @cms_page
    @cms_page.destroy
    respond_to do |format|
      format.html { redirect_to cms_site_pages_path(@cms_site), notice: ' 删除成功.' }
      format.json { head 200 }
    end

  end

  private
    def set_cms_site_and_channel
      @cms_site = Cms::Site.find(params[:site_id])
      @cms_channel = @cms_site.channels.find_by(id: params[:channel_id])
      @cms_channel ||= @cms_site.channels.first
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cms_page
      @cms_page = @cms_channel.pages.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def cms_page_params
    #       #   params.require(:cms_page).permit(:channel_id, :title, :short_title, :properties, :keywords, :description, :image_path, :content)
    #       # end
end
