class Api::V1::OrderDeliveriesController < Api::V1::BaseController
  before_action :authenticate!

  def create
    authorize OrderDelivery
    order_delivery = OrderDelivery.new(permitted_attributes(OrderDelivery))
    order_delivery.list = params['order_delivery']['features']['list']
    order_delivery.note = params['order_delivery']['features']['note']
    if order_delivery.save
      order_delivery.order.delivering!
      if sms_site(order_delivery.order.site.user.mobile.phone_number, order_delivery.order.code, enum_l(order_delivery.order, :internal_status))
        sms_message = '已经用短信提示对方现在的订单状态'
      else
        sms_message = '短信提示发送失败'
      end
      render json: {status: 'ok', order: order_delivery, sms_message: sms_message}
    else
      render json: {status: 'failed', error_message:  order_delivery.errors.full_messages.join(', ') }
    end
  end

end
