class Admin::TrackersDetailedController < Admin::BaseController

  def index
    # 详细
    @visits = Tracker::Visit.all.order(created_at: :desc).page(params[:page]).per(50)
  end

end
