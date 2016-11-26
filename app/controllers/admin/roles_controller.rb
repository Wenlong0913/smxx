class Admin::RolesController < Admin::BaseController
  def index
    authorize Role
    @admin_roles = Role.all
  end
end
