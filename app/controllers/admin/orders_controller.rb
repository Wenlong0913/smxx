# csv support
require 'csv'
class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :refund, :apply_refund]
  before_action :get_user, only: [:create, :update]
  # GET /admin/orders
  def index
    authorize Order
    # @filter_colums = %w(code)
    # @orders = build_query_filter(Order.all, only: @filter_colums).page(params[:page])
    @orders_all = Order.all
    if params[:code].present?
      @orders_all = @orders_all.where("code like ?", "%#{params[:code]}%")
    end
    if params[:q].present?
      @orders_all = @orders_all.where("code like ?", "%#{params[:q]}%")
    end
    if params[:site_name].present?
      @orders_all = @orders_all.joins(:site).where("sites.title like ?", "%#{params[:site_name]}%")
    end
    if params[:search].present?
      if params[:search][:status].present?
        @orders_all = @orders_all.where(status: params[:search][:status])
      end
      if params[:search][:material].present?
        params[:search][:status] = 'completed'
        case params[:search][:material]
        when 'more'
          @orders_all = @orders_all.joins(:order_materials).completed.where("order_materials.amount < order_materials.practical_number").distinct
        when 'less'
          @orders_all = @orders_all.joins(:order_materials).completed.where("order_materials.amount > order_materials.practical_number").distinct
        else
          # do nothing
        end
      end
    end
    if params[:daterange].present?
      date_range = params["daterange"].split(' - ').map(&:strip).map(&:to_date)
      @orders_all = @orders_all.where("Date(orders.created_at) in (?)", date_range[0]..date_range[-1])
    end
    @orders = @orders_all.includes(:site, :order_materials).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        # format.json { render json: {:users => @orders.select(:id, :nickname), :total => @orders.size} }
        format.html { send_data(@orders.to_json, filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@orders.to_xml, filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@orders.as_csv(only: []), filename: "orders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
        format.json { render json: {:results => @orders.as_json(only: [:id, :code]), :total => @orders.size} }
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
    @order.price = @order.price.to_f/100
  end

  # POST /admin/orders
  def create
    authorize Order
    flag, @order = Order::Create.(permitted_attributes(Order).merge(create_by: current_user.id))
    if flag
      redirect_to admin_orders_path(@order), notice: "#{Order.model_name.human} 创建成功."
    else
      @order.price = @order.price.to_f/100
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

  def apply_refund
    authorize Order
    return render json: {status: 'failed', message: '退款申请描述不可为空！'} unless params[:order][:refund_description].present?
    @order.refund_status = 'apply_refund'
    @order.refund_description = params[:order][:refund_description]
    @order.apply_refund_by = current_user.id
    if @order.save
      render json: {status: 'ok', message: "退款提交申请成功"}
    else
      render json: {status: 'failed', message: @order.errors.full_messages.join(', ')}
    end
  end

  def refunds
    authorize Order
    @orders = Order.where("refund_status is not null").order(refund_status: :asc).page(params[:page])
  end

  def refund
    authorize Order
    ret = PaymentCore.create_refund({charge_id: @order.charge.pingpp_charge_id, description: @order.refund_description})
    if ret[:result].blank?
      render json: {status: 'failed', message: "向服务器提交退款申请失败, #{ret[:message]}"}
    else
      @order.refunding!
      render json: {status: 'ok', message: "已向服务器提交退款申请"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def get_user
      if params[:order][:member].present?
        member = Member.find(params[:order][:member])
        params[:order][:user_id] =  member.user.id
      end
    end
    # Only allow a trusted parameter "white list" through.
    # def admin_order_params
    #       #   params.require(:admin_order).permit(policy(@admin_order).permitted_attributes)
    #       # end
end
