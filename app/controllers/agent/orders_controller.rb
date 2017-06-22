class Agent::OrdersController < Agent::BaseController
  before_action :set_order, only: [:show, :update, :order_delivery]
  before_action :set_product_price, only: [:index]

  def index
    @orders = @site.orders.all
    if params[:search].present?
      conditions = []
      query = []
      keywords = params[:search][:keywords]
      price_form = params[:search][:price_from]
      price_to = params[:search][:price_to]
      if !keywords.blank?
        query << "code like ?"
        conditions << "%" + keywords + "%"
      end
      if !price_form.blank?
        query << "price >= ?"
        conditions << price_form.to_f
      end
      if !price_to.blank?
        query << "price <= ?"
        conditions << price_to.to_f
      end
      conditions.unshift query.join(' and ')
      @orders = @orders.where(conditions)
    end
    if params[:reorder]
      case params[:reorder]
      when 'price'
        @orders = @orders.order(price: :desc)
      when 'newest'
        @orders = @orders.order(created_at: :desc)
      end
    end
    @orders = @orders.page(params[:page]).per(10)
  end

  def show
    @order_delivery = @order.order_deliveries.blank? ? @order.order_deliveries.new : @order.order_deliveries.first
  end

  def update
    authorize @order
    if Settings.project.sxhop? || Settings.project.imolin?
      if params[:price].present? && !(@order.open? || @order.pending?)
        return render json: {status: 'failed', message: '订单不可修改'}
      end
      flag, @order = Order::Update.(@order, permitted_attributes(@order))
    else
      flag = @order.delivered! && @order.completed!
    end

    if flag
      render json: {status: 'ok', data: {updated_at: @order.updated_at.strftime("%Y-%m-%d %H:%M:%S")}}
    else
      render json: {status: 'failed', message: @order.errors.full_messages.join(', ')}
    end
  end

  def order_delivery
    @order_delivery = @order.order_deliveries.blank? ? @order.order_deliveries.new : @order.order_deliveries.first
    @order_delivery.logistics_name = params[:order_delivery][:logistics_name]
    @order_delivery.logistics_number = params[:order_delivery][:logistics_number]
    new_record = @order_delivery.new_record?
    if @order_delivery.save
      if Settings.project.sxhop? || Settings.project.imolin?
        @order.delivering! if new_record
      end
      render json: {status: 'ok', message: "#{@order_delivery.logistics_name}(#{@order_delivery.logistics_number})"}
    else
      render json: {status: 'failed', message: @order_delivery.errors.full_messages.join(', ')}
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_product_price
      if params[:search].present?
        params[:search][:price_from] = params[:search][:price_from].to_f * 100 unless params[:search][:price_from].blank?
        params[:search][:price_to] = params[:search][:price_to].to_f * 100 unless params[:search][:price_to].blank?
      end
    end
end
