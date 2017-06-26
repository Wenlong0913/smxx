class Agent::AgentPlansController < Agent::BaseController

  def index
    authorize AgentPlan
    @agent_plans = AgentPlan.all.order("id").page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @agent_plans }
    end
  end

  def charge
    @agent_plan = AgentPlan.find(params[:id])
    finance_bill = FinanceBill.create(
      site_id: @site.id,
      amount: @agent_plan.price,
      is_entry: true
    )
    json = PaymentCore.create_charge(
      order_no: finance_bill.code, # 订单号
      channel: 'alipay_pc_direct', # 支付宝电脑端网页支付
      amount: finance_bill.amount, # 1分钱
      client_ip: '127.0.0.1',
      subject: "商家#{@site.id}购买套餐",
      body: @agent_plan.name,
      extra: {
        success_url: 'http://tao.dev.tanmer.com/agent/agent_plans/:id/paid_success'
      }
    )
    render js: <<-JS
    onStartCharging('#{json.to_json}')
    JS
  end

  def paid_success
    binding.pry
  end
end
