class Admin::Tracker::Visits::StatisticsController < Admin::BaseController
acts_as_trackable
  def show
    authorize :'tracker/home', :index?
    respond_to do |format|
      format.html
      format.json {render json: Tracker::VisitStatistic.page_statistic}
    end

  end

end
