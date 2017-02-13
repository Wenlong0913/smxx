class Agent::OrdersController < Agent::BaseController
  def index
    @orders = Order.all.page(params[:page])
  end
end
