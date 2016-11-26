class Admin::UsersController < Admin::BaseController

  def index
    authorize User
    @admin_users = User.all.page params[:page]
  end

end
