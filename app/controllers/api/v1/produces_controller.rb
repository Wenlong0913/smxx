class Api::V1::ProducesController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_order, only: [:create]

  def index
    authorize Produce
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    orders = Order.all.page(params[:page] || 1).per(page_size)
    orders_json = orders.all.as_json(only: [:code, :price, :status, :internal_status, :description, :created_at], include: {site: {only: [:id, :title]}, member: {only: [:name]}})
    render json: render_base_data(orders_json, orders, page_size)
  end

  def create
    authorize Produce

    produce = Produce.new(order: @order)
    if produce.save
      render json: {status: 'ok', produce: produce.as_json(only: [:id])}
    else
      render json: {status: 'failed', error_message: produce.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end
end
