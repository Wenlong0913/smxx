class Agent::OrdersDesignsController < Agent::BaseController
  before_action :set_orders_design, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:create, :update]
  acts_as_commentable resource: Order

  def index
    # authorize @agent_orders_design
    @orders_designs = @site.orders.page(params[:page]).per(9)
    respond_to do |format|
      format.html
      format.json { render json: @orders_designs }
    end
  end

  def show
    # authorize @agent_orders_design
    respond_to do |format|
      format.html
      format.json { render json: @orders_design }
    end
  end
  #
  # def new
  #   authorize Agent::OrdersDesign
  #   @agent_orders_design = Agent::OrdersDesign.new(agent_orders_design_params)
  # end
  #
  # def edit
  #   authorize @agent_orders_design
  # end
  #
  def create
    # authorize Order
    @order = Order.new(permitted_attributes(Order))
    if @order.save
      render json: {status: 'ok'}
    else
      render json: {status: 'error', message:@order.errors.full_messages.join(',')}
    end

  end

  # def update
  #   authorize @agent_orders_design
  #   respond_to do |format|
  #     format.html do
  #       if @agent_orders_design.update(permitted_attributes(@agent_orders_design))
  #         redirect_to agent_orders_design_path(@agent_orders_design), notice: 'Orders design 更新成功.'
  #       else
  #         render :edit
  #       end
  #     end
  #     format.json { render json: @agent_orders_design }
  #   end
  # end
  #
  # def destroy
  #   authorize @agent_orders_design
  #   @agent_orders_design.destroy
  #   respond_to do |format|
  #     format.html { redirect_to agent_orders_designs_url, notice: 'Orders design 删除成功.' }
  #     format.json { head 200 }
  #   end
  #
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orders_design
      @orders_design = @site.orders.find(params[:id])
    end

    def get_user
      if params[:order][:member].present?
        member = Member.find(params[:order][:member])
        params[:order][:user_id] = member.user.id
      end
    end
end
