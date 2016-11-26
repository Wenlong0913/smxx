class Admin::RolesController < Admin::BaseController
  def index
    @admin_roles = Role.all
  end
end