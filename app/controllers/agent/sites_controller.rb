class Agent::SitesController < Agent::BaseController
  skip_before_action :set_current_site
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def new
    authorize Site
    @agent_site = Site.new
  end

  def edit
    authorize @agent_site
  end

  def create
    authorize Site
    @agent_site = Site.new(permitted_attributes(Site))
    @agent_site.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @agent_site.save
          redirect_to agent_root_path, notice: '创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @agent_site }
    end

  end

  def update
    authorize @agent_site
    respond_to do |format|
      format.html do
        if @agent_site.update(permitted_attributes(@agent_site))
          redirect_to agent_root_path, notice: '更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @agent_site }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @agent_site = Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

end
