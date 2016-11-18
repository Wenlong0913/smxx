class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    mobile = params[:user][:mobile]
    code = params[:user][:code]
    t = Sms::Token.new(mobile)
    if t.valid?(code)
      flag, user = User::Create.(mobile_phone: mobile)
      if flag
        User::Weixin.connect_user(user, OmniAuth::AuthHash.new(session["devise.wechat_data"])) if session["devise.wechat_data"]
        sign_in user, :event => :authentication #this will throw if @user is not activate
        return redirect_to session["omniauth.origin"] if session["omniauth.origin"]
        render json: {}
      else
        render json: {error: '创建失败了，请检查！'}
      end
    else
      render json: {error: '验证码不正确！'}
    end

  end

end
