class Frontend::UsersController < Frontend::BaseController
  before_action :ensure_login!
  def show
  end

  def edit
    authorize current_user
  end
  def update
    authorize @current_user
    if params[:user][:attachments]
      @current_user.avatar = JSON.parse(params[:user][:attachments])["output"]["image"]
      @current_user.avatar_file_name = JSON.parse(params[:user][:attachments])["input"]["name"]
    end
    flag, @current_user = User::Update.(@current_user, permitted_attributes(@current_user))
    if flag
      redirect_to edit_frontend_user_path(@current_user), notice: '更新成功.'
    else
      render :edit
    end
  end

  def self_order
    @user_orders = current_user.orders
  end

  def self_comment
    @comments = Comment::Entry.where(user_id: current_user.id)
  end

  def self_complaint
  end

  def self_message
  end


  def ensure_login!
    redirect_to root_url unless current_user
  end
end
