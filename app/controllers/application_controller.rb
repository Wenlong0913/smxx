class ApplicationController < ActionController::Base
  include Pundit
  include QueryFilterControllerConcern
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  impersonates :user

  private
  def user_not_authorized
    flash[:alert] = "没有访问权限"
    redirect_to(request.referrer || root_path)
  end
end
