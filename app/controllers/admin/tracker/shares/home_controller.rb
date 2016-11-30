class Admin::Tracker::Shares::HomeController < Admin::BaseController
acts_as_trackable
  def show
    authorize :'tracker/home', :index?
  end

end
