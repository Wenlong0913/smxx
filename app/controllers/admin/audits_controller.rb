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
      user = User.find_by(nickname: params["username"])
      conditions.push "user_id = #{user ?  user.id : '-1'}"
    end
    @admint_audits = Audit.where(conditions.join(' and '), date_range[0]..date_range[1]).order(created_at: :desc).page(params[:page])
  end
end
