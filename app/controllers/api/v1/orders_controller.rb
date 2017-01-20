class Api::V1::OrdersController < Api::BaseController
  before_action :authenticate!
  before_action :set_orders, only: [:index]

  def index
    authorize Order
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    orders = @orders.page(params[:page] || 1).per(page_size)
    orders_json = order_json(orders)
    render json: render_base_data(orders_json, orders, page_size, @order_list_type)
  end

  private
    def set_orders
      @order_list_type = params[:order_list_type]
      @orders = case @order_list_type
      when 'processing'
        Order.processing
      when 'cancelled'
        Order.cancelled
      when 'completed'
        Order.completed
      else
        Order.all
      end
    end

    def order_json(orders)
      orders.as_json(only: [:id, :code, :price, :status, :internal_status, :description, :created_at], include: {site: {only: [:id, :title]}, member: {only: [:name]}, produce: {only: [:id]}})
    end
end
