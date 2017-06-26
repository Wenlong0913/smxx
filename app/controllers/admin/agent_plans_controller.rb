# csv support
require 'csv'
class Admin::AgentPlansController < Admin::BaseController
  before_action :set_agent_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_agent_plan_price, only: [:create, :update]
  # GET /admin/agent_plans
  def index
    authorize AgentPlan
    @filter_colums = %w(id)
    @agent_plans = build_query_filter(AgentPlan.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@agent_plans.to_json, filename: "agent_plans-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@agent_plans.to_xml, filename: "agent_plans-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@agent_plans.as_csv(only: []), filename: "agent_plans-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/agent_plans/1
  def show
    authorize @agent_plan
  end

  # GET /admin/agent_plans/new
  def new
    authorize AgentPlan
    @agent_plan = AgentPlan.new
  end

  # GET /admin/agent_plans/1/edit
  def edit
    authorize @agent_plan
  end

  # POST /admin/agent_plans
  def create
    authorize AgentPlan
    @agent_plan = AgentPlan.new(permitted_attributes(AgentPlan))
    if @agent_plan.save
      redirect_to admin_agent_plan_path(@agent_plan), notice: "#{AgentPlan.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/agent_plans/1
  def update
    authorize @agent_plan
    if @agent_plan.update(permitted_attributes(@agent_plan))
      redirect_to admin_agent_plan_path(@agent_plan), notice: "#{AgentPlan.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/agent_plans/1
  def destroy
    authorize @agent_plan
    @agent_plan.destroy
    redirect_to admin_agent_plans_url, notice: "#{AgentPlan.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_plan
      @agent_plan = AgentPlan.find(params[:id])
    end

    def set_agent_plan_price
      params[:agent_plan][:price] = params[:agent_plan][:price].to_f * 100 unless params[:agent_plan][:price].blank?
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_agent_plan_params
    #       #   params.require(:admin_agent_plan).permit(policy(@admin_agent_plan).permitted_attributes)
    #       # end
end
