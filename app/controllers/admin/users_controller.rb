class Admin::UsersController < Admin::BaseController
  before_action :set_admin_user, only: [:update, :edit, :destroy]

  def index
    @admin_users = User.all
    @admin_users = @admin_users.joins(:roles).where("roles.id = ?", params[:role_id])if params[:role_id]
    @admin_users = @admin_users.page params[:page]
  end

  def new
    @admin_user = User.new
  end

  def create
    flag, @admin_user = User::Create.(user_params)
    if flag
      redirect_to admin_users_path, notice: '创建成功！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    flag, @admin_user =  User::Update.(@admin_user, user_params)
    if flag
      redirect_to admin_users_path, notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    flag, @admin_user =  User::Destroy.(@admin_user)
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: '删除成功！' }
      format.json { head :no_content }
    end  
  end

  private
  def user_params
    params.require(:user).permit(:mobile_phone)
  end

  def set_admin_user
    @admin_user = User.find_by(id: params[:id])
  end

end
