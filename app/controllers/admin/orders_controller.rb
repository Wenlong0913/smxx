# csv support
require 'csv'
class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /admin/orders
  def index
    authorize Order
    @filter_colums = %w(id)
    @orders = build_query_filter(Order.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@orders.to_json, filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@orders.to_xml, filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@orders.as_csv(only: []), filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/orders/1
  def show
    authorize @order
  end

  # GET /admin/orders/new
  def new
    authorize Order
    @order = Order.new
  end

  # GET /admin/orders/1/edit
  def edit
    authorize @order
  end

  # POST /admin/orders
  def create
    authorize Order
    @order = Order.new(permitted_attributes(Order))

    if @order.save
      redirect_to admin_order_path(@order), notice: "#{Order.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/orders/1
  def update
    authorize @order
    if @order.update(permitted_attributes(@order))
      redirect_to admin_order_path(@order), notice: "#{Order.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/orders/1
  def destroy
    authorize @order
    @order.destroy
    redirect_to admin_orders_url, notice: "#{Order.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_order_params
    #       #   params.require(:admin_order).permit(policy(@admin_order).permitted_attributes)
    #       # end
end
