class Admin::UsersController < Admin::BaseController

  def index
    @admin_users = User.all.page params[:page]
  end

end
