class Frontend::OrdersController < Frontend::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    authorize Order
    @orders = Order.all.page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @orders }
    end
  end

  def show
    authorize @order
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def new
    @order = site.orders.build
  end

  def edit
  end

  def create
    ActiveRecord::Base.transaction do
      @frontend_order = Order.new
      @frontend_order.user_id = current_user.id
      @frontend_order.site_id = @site.id
      @frontend_order.price = params[:order][:price]
      @frontend_order.description = params[:order][:description]
      @frontend_order.create_by = current_user.id
      @frontend_order.save!
      params[:order][:order_products].each do |order_product_params|
        order_product = @frontend_order.order_products.build
        order_product.product_id = order_product_params[:id]
        order_product.amount = order_product_params[:amount]
        order_product.price = order_product_params[:price]
        order_product.save!
      end
    end
    respond_to do |format|
      format.html do
        if @frontend_order
          redirect_to frontend_order_path(@frontend_order), notice: '订单创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @frontend_order }
    end

  end

  def update
    respond_to do |format|
      format.html do
        if @order.update(permitted_attributes(@order))
          redirect_to frontend_order_path(@order), notice: 'Order 更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @order }
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to frontend_orders_url, notice: 'Order 删除成功.' }
      format.json { head 200 }
    end

  end

  def charge
    order = Order.find(params[:id])
    json = PaymentCore.create_charge(
      order_no: order.code, # 订单号
      channel: 'wx_wap', # 支付宝电脑端网页支付
      amount: order.price, # 1分钱
      client_ip: '127.0.0.1',
      subject: 'E启洗视频',
      body: '成都到丽江5日游 x 5人',
      extra: {
        success_url: 'frontend_orders_url'
      }
    )
    render js: <<-JS
    onStartCharging('#{json.to_json}')
    JS
  end

  def paid_success
    @product = Product.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :product_id, :price, :status)
    end
end
