class Admin::PageStatisticsController< Admin::BaseController
  def index
    @visits = Tracker::Visit.all.order(created_at: :desc).page(params[:page]).per(50)
  end
end
