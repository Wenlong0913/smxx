class Frontend::UsersController < Frontend::BaseController
  def show
  end

  def edit
    authorize current_user
  end
  def update
    authorize @current_user
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

end
