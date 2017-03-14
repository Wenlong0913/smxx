class Admin::RolesController < Admin::BaseController
  before_action :set_role, only: [:edit_permission, :update_permission]

  def index
    authorize Role
    @admin_roles = Role.all.page params[:page]
  end

  def edit_permission
    authorize Role
    sort_permissions
    @chekced_permissions = @role.permission_ids
  end

  def update_permission
    authorize Role
    @role.permission_ids = params[:permission_ids].map(&:to_i).uniq
    if @role.save
      render json: {status: 'ok'}
    else
      render json: {status: 'failed'}
    end
  end

  private
    def sort_permissions
      permission_hash = {}
      checked_status = {}
      Permission.all.each do |permission|
        if permission_hash[permission.group_name].blank?
          permission_hash[permission.group_name] = []
          checked_status[permission.group_name] = false
        end
        permission_hash[permission.group_name] << permission.as_json(only: [:id, :name, :group_name])
      end
      @permissions = permission_hash
      @checked_status = checked_status
    end

    def set_role
      @role = Role.find(params[:id])
    end
end
