class Admin::OrderDeliveriesController < Admin::BaseController
  acts_as_trackable resource: Proc.new {current_user.sites.first}

  def index
    authorize OrderDelivery
    @order_deliveries = OrderDelivery.all.page(params[:page])
  end
end
