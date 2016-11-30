class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  acts_as_themeable 'color_admin'

  private

  def ensure_admin_user!
    redirect_to admin_sign_in_url unless current_user && current_user.has_role?(:admin)
  end

  def user_not_authorized
    flash[:alert] = "你没有权限执行此操作！"
    redirect_to(request.referrer || root_path)
  end
end
