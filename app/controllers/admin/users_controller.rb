class Admin::UsersController < Admin::BaseController
  before_action :set_admin_user, only: [:update, :edit, :destroy]

  def index
    authorize User
    @admin_users = User.all
    @admin_users = @admin_users.joins(:roles).where("roles.id = ?", params[:role_id])if params[:role_id]
    @admin_users = @admin_users.includes(:roles, :mobile).page params[:page]
  end

  def new
    authorize User
    @admin_user = User.new
  end

  def create
    authorize User
    flag, @admin_user = User::Create.(permitted_attributes(User), current_user)
    if flag
      redirect_to admin_users_path, notice: '用户创建成功！'
    else
      render :new
    end
  end

  def edit
    authorize @admin_user
  end

  def update
    authorize @admin_user
    flag, @admin_user =  User::Update.(@admin_user, permitted_attributes(@admin_user), current_user)
    if flag
      redirect_to admin_users_path, notice: '用户更新成功！'
    else
      render :edit
    end
  end

  def destroy
    authorize @admin_user
    flag, @admin_user =  User::Destroy.(@admin_user)
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: '用户删除成功！' }
      format.json { head :no_content }
    end  
  end

  private

  def set_admin_user
    @admin_user = User.find_by(id: params[:id])
  end

end
