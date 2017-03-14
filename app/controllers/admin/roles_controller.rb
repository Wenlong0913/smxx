class Admin::RolesController < Admin::BaseController
  def index
    authorize Role
    @admin_roles = Role.all.page params[:page]
  end

  def edit_permission
    authorize Role
    @permissions = sort_permissions
  end

  def update_permission
    authorize Role
  end

  private
    def sort_permissions
      permission_hash = {}
      Permission.all.each do |permission|
        permission_hash[permission.group_name] = [] if permission_hash[permission.group_name].blank?
        permission_hash[permission.group_name] << permission.as_json(only: [:id, :name, :group_name])
      end
      permission_hash
    end
end
