class Frontend::OrdersController < Frontend::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm, :refund]
  before_action :ensure_login!

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
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def edit
  end

  def create
    ActiveRecord::Base.transaction do
      price = 0
      params[:order][:order_products].each do |order_product|
        price += order_product[:price].to_f
      end
      @frontend_order = Order.new
      @frontend_order.user_id = current_user.id
      @frontend_order.site_id = @site.id
      @frontend_order.price = price
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
    if params[:order_id]
      order = Order.find(params[:order_id])
      product = order.order_products.first.product
    else
      order = Order.new(user: current_user)
      product = Product.find(params[:order][:product][:id])
      order.order_products.new(product_id: product.id, amount: params[:order][:product][:number], price: product.sell_price)
      order.delivery_phone = params[:order][:delivery_phone]
      order.site = product.site
      order.price = product.sell_price.to_f * params[:order][:product][:number].to_i
      order.save!
    end
    callback_url = URI(Settings.site.host)
    options = 'frontend/orders/' + order.id.to_s + '/paid_success'
    json = PaymentCore.create_charge(
      order_no: order.code, # 订单号
      channel: 'alipay_pc_direct', # 支付宝电脑端网页支付
      amount: order.price, # 1分钱
      client_ip: request.remote_addr,
      subject: "购买#{product.name}",
      body: product.name,
      extra: {
        success_url: callback_url.merge(options).to_s
      }
    )
    render js: <<-JS
    onStartCharging('#{json.to_json}')
    JS
  end

  def paid_success
    order = Order.find_by_code(params[:out_trade_no])
    redirect_to frontend_order_path(order)
  end

  #实现客户端订单查询
  #订单查询页面
  def search
  end
  #post
  #params: mobile/order_id
  def do_search
    if params[:keywords].blank?
      render :search
    else
      redirect_to search_result_frontend_orders_path(keywords: params[:keywords])
    end
  end
  #订单显示页面
  def search_result
    user = nil
    if params[:keywords] =~ /^\d{11}$/
      mobile = User::Mobile.where(phone_number: params[:keywords])
      user = mobile.first.user unless mobile.blank?
    end

    @orders = if user.present?
      user.orders
    else
      Order.where(code: params[:keywords])
    end

    @orders =  @orders.page(params[:page]).per(6)

    if @orders.blank?
      redirect_to search_frontend_orders_path, notice: '未找到该订单号/手机号的订单信息，请重新输入'
    end

  end

  def confirm
    @order.completed!
    @order.order_products.each do |order_product|
      product = order_product.product
      product.sales_count += order_product.amount
      product.save!
    end
    redirect_to frontend_order_path(@order)
  end

  def refund
    if @order.refund_status.blank?
      @order.refund_status = 'apply_refund'
      @order.refund_description = "用户申请退款"
      @order.apply_refund_by = current_user.id
      @order.save!
    end
    redirect_to frontend_order_path(@order)
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

    def ensure_login!
      redirect_to root_url unless current_user
    end
end
