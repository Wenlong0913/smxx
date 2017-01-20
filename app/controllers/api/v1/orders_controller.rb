class Api::V1::OrdersController < Api::BaseController
  before_action :authenticate!

  def index
    authorize Order
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    orders = Order.all.page(params[:page] || 1).per(page_size)
    orders_json = orders.all.as_json(only: [:id, :code, :price, :status, :internal_status, :description, :created_at], include: {site: {only: [:id, :title]}, member: {only: [:name]}, produce: {only: [:id]}})
    render json: render_base_data(orders_json, orders, page_size)
  end
end
