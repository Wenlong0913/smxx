class Frontend::OrdersController < Frontend::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @orders }
    end
  end

  def show
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
        binding.pry
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
    # 获取当前用户订单号
    order = @site.orders.find(params[:id])
    # 获取当前订单下的所有产品
    order_products = OrderProduct.where(order_id: order.id)
    # 获取当前订单所有订单产品信息
    products = Product.where(id: order_products.first.product_id)
    # sum 订单下的所有产品价钱累加
    sum = 0
    order_products.each do |op|
      sum = op.price.to_f * op.amount + sum
    end
    binding.pry
    json = PaymentCore.create_charge(
      order_no: order.code, # 订单号
      channel: 'alipay_pc_direct', # 支付宝电脑端网页支付
      amount: sum, # 1分钱
      client_ip: '127.0.0.1',
      subject: 'E启洗视频',
      body: products[0].name,
      extra: {
        success_url: 'http://eqxy.lvh.me:5000/frontend/orders/1/paid_success'
      }
    )
    render js: <<-JS
    onStartCharging('#{json.to_json}')
    JS
  end

  def paid_success
    @product = Product.find(params[:id])
  end

  #实现客户端订单查询
  #订单查询页面
  def search
  end
  #post
  #params: mobile/order_id
  def do_search

  end
  #订单显示页面
  def search_result

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
