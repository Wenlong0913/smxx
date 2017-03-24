class Agent::Tracker::SharesController < Agent::BaseController

  def index
    authorize :'tracker/home', :index?
    respond_to do |format|
      format.html
      format.json {render json: Tracker::Share.records(current_user, params[:page])}
    end
  end

  # def show
  #   respond_to do |format|
  #     format.html
  #     format.json {render json: Tracker::Share.child_records(params[:id], current_user) }
  #   end
  # end

end
