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
    @user_orders = current_user.orders.order("updated_at DESC").page(params[:page])
  end

  def self_comment
    @comments = Comment::Entry.where(user_id: current_user.id).order("updated_at DESC").page(params[:page])
    @product_comments = @comments.group_by{|c| c.resource}
  end

  def self_complaint
  end

  def self_message
  end


  def ensure_login!
    redirect_to root_url unless current_user
  end

  def binding_phone
    if params['user']
      t = Sms::Token.new(params['user']['mobile'])
      if t.valid?(params['user']['code'])
        t.destroy!
        mobile = current_user.mobile || current_user.build_mobile
        mobile.phone_number = params['user']['mobile']
        if mobile.save
          render json: {}
        else
          render json: {error: mobile.errors.full_messsages}
        end
      else
        render json: {error: '验证码不正确！'}
      end
    end
  end

  def binding_weixin
    if params[:code]
      conn = Faraday.new(:url => 'http://wxopen.tanmer.com')
      response = conn.get('/wx/mp_auth/wx4c40bb18df07aafc/fetch_uid/%s' % params[:code])
      data = JSON.parse(response.body)
      if data['uid']
        current_user.weixin = User::Weixin.find_or_create_by(uid: data['uid'])
        render json: { success: true }
      else
        render json: { success: false }
      end
    end
  end

end
