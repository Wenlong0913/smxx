class Users::Weixins::ConnectsController < ApplicationController
  WEB_QR_TIMEOUT_SEC = 120


  def new
    if params[:format] == 'png'
      @token = get_token
      qrcode = RQRCode::QRCode.new(confirm_users_weixins_connects_url(token: @token))
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
    else
      @token = generate_token
      @timeout_sec = WEB_QR_TIMEOUT_SEC
      render json: {token: @token, timeout_sec: @timeout_sec}      
    end
  end


  def create
    @token = get_token
    if session["weixin_uid"]
      redis = Redis.current
      key = token_key(@token)
      @success = !!redis.get(key)
      if @success
        redis.set key, session["weixin_uid"]
        @message = 'success'
      else
        @message = 'fail'
      end
    else
      redirect_to user_wechat_omniauth_authorize_url(origin: request.original_url)
    end
  end

  def confirm
    @token = get_token
  end

  def status
    @status = ''
    @token = get_token
    redis = Redis.current
    key = token_key(@token)
    if redis.get(key) != 'n/a'
      weixin_uid = redis.get(key)
      weixin_user = User::Weixin.find_by_uid(weixin_uid)
      if weixin_user.user
        @status = 'used'
      else
        weixin_user.user = current_user
        if weixin_user.save
          @status = 'success'
        else
          @status = 'fail'
        end
      end
    else
      @status = 'waiting'
    end
    render json: {status: @status}
  end

  private
  def generate_token
    redis = Redis.current
    token = SecureRandom.uuid.remove('-')
    redis.set token_key(token), 'n/a'
    redis.expire token_key(token), WEB_QR_TIMEOUT_SEC
    token
  end

  def token_key(token)
    token = "weixin-web-qr-connect:#{token}"
  end

  def get_token
    @token = params[:token]
  end

end