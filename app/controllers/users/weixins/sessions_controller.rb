class Users::Weixins::SessionsController < ApplicationController

    before_action :get_token, only: [:create]

    WEB_QR_TIMEOUT_SEC = 120

    def new
      @token = generate_token
      @timeout_sec = WEB_QR_TIMEOUT_SEC
      render json: {token: @token, timeout_sec: @timeout_sec}
    end

    # 微信二维码扫码登录验证
    def create
      redis = Redis.current
      user_id = redis.get(token_key(@token))
      if user_id.nil?
        render json: { status: 'timeout' }
      elsif user_id == 'n/a'
        render json: { status: 'waiting' }
      else
        user = User.find_by(id: user_id)
        if user
          sign_in user
          render json: { status: 'ok', url: user.super_admin_or_admin? ? admin_root_path : root_path }
        else
          render json: { status: 'failed' }
        end
      end
    end

    private
      def generate_token
        redis = Redis.current
        token = SecureRandom.uuid.remove('-')
        redis.set token_key(token), "n/a"
        redis.expire token_key(token), WEB_QR_TIMEOUT_SEC
        token
      end

      def get_token
        @token = params[:token]
      end

      def token_key(token)
        token = "weixin-web-qr-login:#{token}"
      end

end