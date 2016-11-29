class Admin::Tracker::DetailsController < Admin::BaseController

  # 详细
  def show
    authorize :'tracker/home', :index?
    respond_to do |format|
      format.html
      format.json {render json: Tracker::Visit.visits}
      # Tracker::Visit.visits(page: 2) 第二页
    end
  end

end
