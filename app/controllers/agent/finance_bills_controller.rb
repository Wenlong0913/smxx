class Agent::FinanceBillsController < Agent::BaseController

  def index
    authorize FinanceBill
    @agent_finance_bills = FinanceBill.all.order("created_at DESC").page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @agent_finance_bills }
    end
  end

  def new
    authorize FinanceBill
    @orders = Order.completed
    @agent_finance_bill = FinanceBill.new(agent_finance_bill_params)
  end

  def create
    authorize FinanceBill
    flag = true
    FinanceBill.transaction do
      begin
        @agent_finance_bill = FinanceBill.new(permitted_attributes(FinanceBill))
        orders = Order.completed.where(id: params[:finance_bill][:order_ids])
        if orders.any?
          @agent_finance_bill.amount = orders.sum(:price).to_f/100
          @agent_finance_bill.status = 'open'
          @agent_finance_bill.save!
          orders.update_all(finance_bill_id: @agent_finance_bill.id, status: 'cashed')
        end
      rescue
        flag = false
      end
    end
    respond_to do |format|
      format.html do
        if flag
          redirect_to agent_finance_bills_path, notice: '申请提现成功.'
        else
          render :new
        end
      end
      format.json { render json: @agent_finance_bill }
    end

  end

  def fund

  end

  private

    # Only allow a trusted parameter "white list" through.
    def agent_finance_bill_params
      params[:agent_finance_bill]
    end
end
