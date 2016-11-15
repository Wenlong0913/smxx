class Users::SessionsController < Devise::SessionsController
  def create
    login_type = params[:login_type]
    if login_type == "mobile"
      login_with_mobile
    end
  end

  private
    def login_with_mobile
      mobile_user = MobileUser.find_by(phone_number: params[:mobile_phone])
      if mobile_user
        t = Sms::Token.new(params[:mobile_phone])
        if (Rails.env.development? && params[:token] == '1234') || t.valid?(params[:token])
          sign_in mobile_user.user
          render json: {}
        else
          render json: {error: '验证码错误！'}
        end
      else
        render json: {error: '您尚未注册！'}
      end
    end
end