class Admin::SessionsController < Admin::BaseController
  def new
    @user = User.new
  end
end
