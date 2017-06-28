# csv support
require 'csv'
class Admin::FinanceBillsController < Admin::BaseController
  before_action :set_finance_bill, only: [:show, :checked]

  # GET /admin/finance_bills
  def index
    authorize FinanceBill
    @filter_colums = %w(id)
    @finance_bills = build_query_filter(FinanceBill.all.where(is_entry: false), only: @filter_colums).order("updated_at DESC").page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@finance_bills.to_json, filename: "finance_bills-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@finance_bills.to_xml, filename: "finance_bills-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@finance_bills.as_csv(only: []), filename: "finance_bills-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/finance_bills/1
  def show
    authorize @finance_bill
  end

  def checked
    authorize @finance_bill
    @finance_bill.checked!
    redirect_to :back
  end

  # DELETE /admin/finance_bills/1
  def destroy
    authorize @finance_bill
    @finance_bill.destroy
    redirect_to admin_finance_bills_url, notice: "#{FinanceBill.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance_bill
      @finance_bill = FinanceBill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_finance_bill_params
    #       #   params.require(:admin_finance_bill).permit(policy(@admin_finance_bill).permitted_attributes)
    #       # end
end
