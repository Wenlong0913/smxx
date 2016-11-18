class Admin::TrackersVisitsController < Admin::BaseController

  def index
    # 汇总
    @visits = Tracker::Visit.all.order(created_at: :desc).page(params[:page]).per(50)
  end

end
