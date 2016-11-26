class Admin::SessionsController < Admin::BaseController
  skip_before_action :ensure_admin_user!
  def new
    @user = User.new
  end
end
