class Cms::PagesController < Cms::BaseController
  before_action :set_cms_site_and_channel
  before_action :set_cms_page, only: [:show, :edit, :update, :destroy]

  def index
    @cms_pages = @cms_channel.pages.page(params[:page])
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
          redirect_to cms_site_channel_path(@cms_site, @cms_channel), notice: 'Page 创建成功.'
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
          redirect_to cms_site_channel_path(@cms_site, @cms_channel), notice: 'Page 更新成功.'
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
      format.html { redirect_to cms_site_channel_path(@cms_site, @cms_channel), notice: 'Page 删除成功.' }
      format.json { head 200 }
    end

  end

  private
    def set_cms_site_and_channel
      @cms_site = Cms::Site.find(params[:site_id])
      @cms_channel = @cms_site.channels.find(params[:channel_id])
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
