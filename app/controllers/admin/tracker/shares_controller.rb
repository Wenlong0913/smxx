class Admin::Tracker::SharesController < Admin::BaseController

  def index
    authorize :'tracker/home', :index?
    page = params[:page] ||= 1
    respond_to do |format|
      format.html
      format.json {render json: Tracker::Share.records(page, current_user)}
    end
  end

  # def show
  #   respond_to do |format|
  #     format.html
  #     format.json {render json: Tracker::Share.child_records(params[:id], current_user) }
  #   end
  # end

end
