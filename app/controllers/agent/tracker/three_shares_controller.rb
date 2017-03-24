class Agent::Tracker::ThreeSharesController < Agent::BaseController

  def index
    respond_to do |format|
      format.html
      format.json {render json: Tracker::Share.find_child_three_records(params[:share_id], params[:two_share_id], current_user) }
    end
  end

end
