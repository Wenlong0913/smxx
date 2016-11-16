class Users::SessionsController < Devise::SessionsController
  def create
    if params[:user][:mobile]
      login_with_mobile(params[:user][:mobile], params[:user][:code])
    else
      render json: {error: '只支持手机号登录！'}
    end
  end

  private
    def login_with_mobile(mobile, code)
      user = User::Mobile.find_by(phone_number: mobile).try(:user)
      if user
        t = Sms::Token.new(mobile)
        if (Rails.env.development? && code == '1234') || t.valid?(code)
          sign_in user
          render json: {}
        else
          render json: {error: '验证码错误！'}
        end
      else
        render json: {error: '账号不可用！'}
      end
    end
end