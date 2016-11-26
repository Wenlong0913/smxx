class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!
  acts_as_themeable 'color_admin'

  private

  def ensure_admin_user!
    redirect_to admin_sign_in_url unless current_user && current_user.has_role?(:admin)
  end
end
