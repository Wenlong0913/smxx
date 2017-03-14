class Api::V1::OrderDeliveriesController < Api::V1::BaseController
  before_action :authenticate!

  def create
    authorize OrderDelivery
    order_delivery = OrderDelivery.new(permitted_attributes(OrderDelivery))
    order_delivery.list = params['order_delivery']['features']['list']
    order_delivery.note = params['order_delivery']['features']['note']
    if order_delivery.save!
      order_delivery.order.delivering!
      render json: {status: 'ok', order: order_delivery}
    else
      render json: {status: 'failed', error_message:  order_delivery.errors.full_messages.join(', ') }
    end
  end

end
