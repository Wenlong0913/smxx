class Users::Weixins::WebQrcodesController < ApplicationController
  before_action :get_token, only: [:new, :show]

  # 新建微信二维码登陆需要的URL
  def new

    if params[:weixin_uid].present? && !current_user
      user = User::Weixin.find_by_uid(params[:weixin_uid]).try(:user)
      sign_in user if user
    end

    unless current_user
      redirect_to user_wechat_omniauth_authorize_path(origin: request.original_url)
      return    
    end

    redis = Redis.current
    key = token_key(@token)
    @success = !!redis.get(key)
    if @success
      redis.set key, current_user.id
      redis.expire key, 30
    end
    
    redirect_to root_path
  end

  # 二维码
  def show
    qrcode = RQRCode::QRCode.new(new_users_weixins_web_qrcodes_url(token: @token))
    send_data qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 240,
      border_modules: 4,
      module_px_size: 6,
      file: nil
    )
  end

  private 
    def get_token
      @token = params[:token]
    end

    def token_key(token)
      token = "weixin-web-qr-login:#{token}"
    end

end