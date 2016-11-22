class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def pundit_user
    CurrentContext.new(current_user, self.class, action_name)
  end

  private
  def user_not_authorized
    flash[:alert] = "没有访问权限"
    redirect_to(request.referrer || root_path)
  end

end
