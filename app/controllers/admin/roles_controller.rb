class Admin::RolesController < Admin::BaseController
  before_action :set_role, only: [:edit_permission, :update_permission]

  def index
    authorize Role
    @admin_roles = Role.all.page params[:page]
  end

  def edit_permission
    authorize @role
    sort_permissions
    @chekced_permissions = @role.permission_ids
  end

  def update_permission
    authorize @role
    @role.permission_ids = params[:permission_ids].try{map(&:to_i).uniq}
    if @role.save
      redirect_to admin_roles_path(@product), notice: '权限修改成功.'
    else
      render json: {status: 'failed', message: '权限修改出错.'}
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
