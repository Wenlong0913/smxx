class Admin::RolesController < Admin::BaseController
  def index
    @admin_roles = Role.all.page params[:page]
  end
end