class Admin::AuditsController < Admin::BaseController
  def index
    authorize Audit
    conditions = []
    date_range = []
    if params["daterange"].present?
      date_range = params["daterange"].split(' - ').map(&:strip).map(&:to_date)
      conditions.push "Date(created_at) in (?)"
    end
    if params["username"].present?
      conditions.push "user_id = #{params["username"]}"
    end
    if params["auditable_type"].present?
      conditions.push "auditable_type = '#{params["auditable_type"]}'"
    end
    if params["auditable_id"].present?
      conditions.push "auditable_id = '#{params["auditable_id"]}'"
    end
    
    @admint_audits = Audit.where(conditions.join(' and '), date_range[0]..date_range[1]).order(created_at: :desc).page(params[:page])
  end
end
