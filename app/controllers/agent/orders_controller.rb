class Agent::OrdersController < Agent::BaseController
  before_action :set_order, only: [:update]

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

  def update
    if @order.delivered!
      render json: {status: 'ok'}
    else
      render json: {status: 'failed', message: @order.errors.full_messages.join(', ')}
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
end
