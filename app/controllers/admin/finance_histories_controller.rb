# csv support
require 'csv'
class Admin::FinanceHistoriesController < Admin::BaseController
  before_action :set_finance_history, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: [:index,:new]
  # GET /admin/finance_histories
  def index
    authorize FinanceHistory
    return redirect_to admin_root_path, alert: "访问的页面不存在" unless @type
    @finance_histories_all = FinanceHistory.all.send(@type)
    if params["daterange"].present?
      date_range = params["daterange"].split(' - ').map(&:strip).map(&:to_date)
      @finance_histories_all = @finance_histories_all.where("operate_date in (?)", date_range[0]..date_range[1])
    end
    @finance_histories = @finance_histories_all.order("updated_at DESC").page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@finance_histories.to_json, filename: "finance_histories-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@finance_histories.to_xml, filename: "finance_histories-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@finance_histories_all.as_csv(only: [:operate_date, :amount, :note]), filename: "finance_histories-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/finance_histories/1
  def show
    authorize @finance_history
  end

  # GET /admin/finance_histories/new
  def new
    authorize FinanceHistory
    @finance_history = FinanceHistory.new
  end

  # GET /admin/finance_histories/1/edit
  def edit
    authorize @finance_history
  end

  # POST /admin/finance_histories
  def create
    authorize FinanceHistory
    @finance_history = FinanceHistory.new(permitted_attributes(FinanceHistory))

    if @finance_history.save
      redirect_to admin_finance_history_path(@finance_history), notice: "#{FinanceHistory.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/finance_histories/1
  def update
    authorize @finance_history
    if @finance_history.update(permitted_attributes(@finance_history))
      redirect_to admin_finance_history_path(@finance_history), notice: "#{FinanceHistory.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/finance_histories/1
  def destroy
    authorize @finance_history
    @finance_history.destroy
    redirect_to admin_finance_histories_url, notice: "#{FinanceHistory.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance_history
      @finance_history = FinanceHistory.find(params[:id])
    end

    def set_type
      @type = nil
      if ['in', 'out'].include?(params[:type])
        @type = params[:type]
        @operate_type_name = enum_i18n(FinanceHistory, :operate_type, @type)
      else
        @type = 'in'
      end
    end
    # Only allow a trusted parameter "white list" through.
    # def admin_finance_history_params
    #       #   params.require(:admin_finance_history).permit(policy(@admin_finance_history).permitted_attributes)
    #       # end
end
