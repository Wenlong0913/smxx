class Admin::Tracker::SharesController < Admin::BaseController

  def show
    authorize :'tracker/home', :index?
  end

end
