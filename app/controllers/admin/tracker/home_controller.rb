class Admin::Tracker::HomeController < Admin::BaseController

  # 汇总
  def index

    respond_to do |format|
      format.html
      format.json {render json: Tracker::Summary.report}
    end
  end

end
