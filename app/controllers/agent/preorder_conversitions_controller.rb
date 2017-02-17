class Agent::PreorderConversitionsController < Agent::BaseController
  before_action :set_preorder_conversition, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:create, :update]
  acts_as_commentable resource: Ticket

  def index
    # authorize @agent_orders_design
    @preorder_conversitions = @site.preorder_conversitions.page(params[:page]).per(9)
    respond_to do |format|
      format.html
      format.json { render json: @preorder_conversitions }
    end
  end

  def show
    # authorize @agent_orders_design
    respond_to do |format|
      format.html
      format.json { render json: @preorder_conversition }
    end
  end

  # def new
  #   authorize PreorderConversition
  #   @preorder_conversition = PreorderConversition.new(preorder_conversition_params)
  # end
  #
  # def edit
  #   authorize @preorder_conversition
  # end

  def create
    # authorize Order
    @preorder_conversition = @site.preorder_conversitions.new(permitted_attributes_for_create(Order))
    if @preorder_conversition.save
      render json: {status: 'ok', url: agent_orders_designs_path}
    else
      render json: {status: 'error', message:@preorder_conversition.errors.full_messages.join(',')}
    end
  end

  # def update
  #   authorize @preorder_conversition
  #   respond_to do |format|
  #     format.html do
  #       if @preorder_conversition.update(permitted_attributes(@preorder_conversition))
  #         redirect_to agent_preorder_conversition_path(@preorder_conversition), notice: 'Preorder conversition 更新成功.'
  #       else
  #         render :edit
  #       end
  #     end
  #     format.json { render json: @preorder_conversition }
  #   end
  # end
  #
  # def destroy
  #   authorize @preorder_conversition
  #   @preorder_conversition.destroy
  #   respond_to do |format|
  #     format.html { redirect_to agent_preorder_conversitions_url, notice: 'Preorder conversition 删除成功.' }
  #     format.json { head 200 }
  #   end
  #
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preorder_conversition
      @preorder_conversition = @site.preorder_conversitions.find(params[:id])
    end

    def get_user
      if params[:order][:member].present?
        member = Member.find(params[:order][:member])
        params[:order][:user_id] = member.user.id
      end
    end
end
