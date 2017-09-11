class Frontend::UsersController < Frontend::BaseController
  skip_before_action :verify_authenticity_token, :only => [:headshot]
  before_action :ensure_login!
  def show
  end

  def edit
    authorize current_user
  end
  def update
    authorize @current_user
    flag, @current_user = User::Update.(@current_user, permitted_attributes(@current_user))
    if flag
      redirect_to users_path, notice: '信息修改成功！'
    else
      render :edit
    end
  end

  def self_order
    if ['pending', 'open', 'paid', 'completed', 'cancelled'].include?(params[:type])
      @user_orders = current_user.orders.where(status: params[:type]).order("updated_at DESC").page(params[:page])
    else
      @user_orders = current_user.orders.order("updated_at DESC").page(params[:page])
    end
  end

  def self_comment
    if params[:type]
      @comments = Comment::Entry.where(user_id: current_user.id, resource_type: params[:type]).order("updated_at DESC").page(params[:page])
    else
      @comments = Comment::Entry.where(user_id: current_user.id).order("updated_at DESC").page(params[:page])
    end
    @product_comments = @comments.group_by{|c| c.resource}
  end

  def self_complaint
    @complaint = Complaint.new
    if params[:complaint]
      complaint = Complaint.new(user_id: current_user.id, reason: params[:complaint][:reason], complaint_type: "feedback")
      if complaint.save
        redirect_to users_path(current_user), notice: "发布成功"
      else
        render
      end
    end
  end

  def self_message
    if params[:type] == 'unread'
      @notifications = Notification.where(user: current_user).unread.order('updated_at DESC')
      Notification.read!(@notifications.select(&:id))    
    else
      @notifications = Notification.where(user: current_user).where("read_at is not null").order('updated_at DESC')
    end
  end

  def ensure_login!
    redirect_to root_url unless current_user
  end

  def binding_phone
    @return_url = params[:return_url] if params[:return_url].present?
    if params['user']
      t = Sms::Token.new(params['user']['mobile'])
      if t.valid?(params['user']['code'])
        t.destroy!
        mobile = current_user.mobile || current_user.build_mobile
        mobile.phone_number = params['user']['mobile']
        if mobile.save
          render json: {}
        else
          render json: {error: mobile.errors.full_messages}
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

  def headshot
    if params[:user][:attachments]
      @current_user.avatar = JSON.parse(params[:user][:attachments])["output"]["image"]
      @current_user.avatar_file_name = JSON.parse(params[:user][:attachments])["input"]["name"]
    end
    if @current_user.save
      render json: { success: true , url: current_user.display_headshot }
    else
      render :edit
    end
  end

end
