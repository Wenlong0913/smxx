class Admin::SessionsController < Admin::BaseController
  skip_before_action :ensure_admin_user!
  skip_after_action :verify_authorized
  def new
    @user = User.new
  end
end
