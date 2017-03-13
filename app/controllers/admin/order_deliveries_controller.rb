class Admin::OrderDeliveriesController < Admin::BaseController
  def index
    authorize OrderDelivery
    @order_deliveries = OrderDelivery.all.page(params[:page])
  end
end
