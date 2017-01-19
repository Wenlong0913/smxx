# csv support
require 'csv'
class Admin::MaterialStockAlertsController < Admin::BaseController
  before_action :set_material_stock_alert, only: [:show, :edit, :update, :destroy]

  # GET /admin/material_stock_alerts
  def index
    authorize MaterialStockAlert
    @filter_colums = %w(id)
    @material_stock_alerts = build_query_filter(MaterialStockAlert.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@material_stock_alerts.to_json, filename: "material_stock_alerts-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@material_stock_alerts.to_xml, filename: "material_stock_alerts-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@material_stock_alerts.as_csv(only: []), filename: "material_stock_alerts-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end
end
