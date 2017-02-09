class Agent::MembersController < Agent::BaseController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    authorize Member
    @agent_members = Member.where(site_id: @site.id).page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @agent_members }
    end
  end

  def show
    authorize @agent_member
    respond_to do |format|
      format.html
      format.json { render json: @agent_member }
    end
  end

  def new
    authorize Member
    @agent_member = Member.new
  end

  def edit
    authorize @agent_member
  end

  def create
    authorize Member
    @agent_member = Member.new(permitted_attributes(Member))
    # @agent_member.user_id = ?
    @agent_member.site_id = @site.id
    respond_to do |format|
      format.html do
        if @agent_member.save
          redirect_to agent_member_path(@agent_member), notice: 'Member 创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @agent_member }
    end

  end

  def update
    authorize @agent_member
    respond_to do |format|
      format.html do
        if @agent_member.update(permitted_attributes(@agent_member))
          redirect_to agent_member_path(@agent_member), notice: 'Member 更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @agent_member }
    end
  end

  def destroy
    authorize @agent_member
    @agent_member.destroy
    respond_to do |format|
      format.html { redirect_to agent_members_url, notice: 'Member 删除成功.' }
      format.json { head 200 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @agent_member = Member.where(site_id: @site.id, id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
end
