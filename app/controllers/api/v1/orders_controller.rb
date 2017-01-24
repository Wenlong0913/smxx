class Api::V1::OrdersController < Api::BaseController
  before_action :authenticate!
  before_action :set_orders, only: [:index]

  def index
    authorize Order
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    orders = params['search_content'].blank? ? @orders : @orders.where("code like :key", {key: ['%',params['search_content'].upcase, '%'].join})
    orders = orders.page(params[:page] || 1).per(page_size)
    orders_json = order_json(orders)
    render json: render_base_data(orders_json, orders, page_size, @order_list_type)
  end

  def create
    authorize Order
    flag, order = Order::Create.(permitted_attributes(Order).merge(image_item_ids: params["image_item_ids"]))
    if flag
      render json: {status: 'ok', order: order_json(order)}
    else
      render json: {status: 'failed', error_message:  order.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
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
