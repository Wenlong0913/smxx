class Api::V1::OrderMaterialsController < Api::BaseController
  before_action :authenticate!
  before_action :set_order, only: [:index, :create]

  def index
    authorize Order
    order_materials = @order.order_materials
    render json: order_materials_json(order_materials)
  end

  def create
    authorize Order
    order_material = @order.order_materials.new(permitted_attributes(OrderMaterial))
    if order_material.save
      render json: {status: 'ok', order_material: order_materials_json(order_material)}
    else
      render json: {status: 'failed', error_message:  order_material.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  def destroy
    OrderMaterial.find(params[:id]).destroy
    render json: {status: 'ok'}
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end

    def order_materials_json(order_materials)
      order_materials.as_json(only: [:id, :amount],
        include: {
          material: { only: [:name], methods: [:price] }
        }
      )
    end
end
