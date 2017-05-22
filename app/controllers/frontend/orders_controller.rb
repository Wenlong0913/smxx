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
    authorize Order
    binding.pry
    @order = Order.new(order_params)
  end

  def edit
    authorize @order
  end

  def create
    authorize Order
    @order = Order.new(permitted_attributes(Order))

    respond_to do |format|
      format.html do
        if @order.save
          redirect_to frontend_order_path(@order), notice: 'Order 创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @order }
    end

  end

  def update
    authorize @order
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
    authorize @order
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
