class Admin::Tracker::Shares::HomeController < Admin::BaseController

  def show
    authorize :'tracker/home', :index?
  end

end
