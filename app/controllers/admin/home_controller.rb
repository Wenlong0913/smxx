class Admin::HomeController < Admin::BaseController
  acts_as_trackable
  skip_after_action :verify_authorized
  def index
  end
end
