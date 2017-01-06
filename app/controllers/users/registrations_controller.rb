class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  ##
  # User register with mobile number
  #
  # Post /sign_up
  #
  # params:
  #   user  - with two attributes :mobile, :code
  #
  # = Examples
  #
  #   resp = conn.post("/sign_up", {"user" => {"mobile" => '18687878787', "code" => '1234'}})
  #   resp.body
  #   => {}
  #
  #   resp = conn.post("/sign_up", {"user" => {"mobile" => '18687878787', "code" => '1235'}})
  #   resp.body
  #   => {error: '验证码不正确！'}
  #   
  #   resp = conn.post("/sign_up", {"user" => {"mobile" => '18688787', "code" => '1234'}})
  #   resp.body
  #   => {error: '创建失败了，请检查！'}
  #   
  def create
    mobile = params[:user][:mobile]
    code = params[:user][:code]
    t = Sms::Token.new(mobile)
    if t.valid?(code)
      user_attributes = {}
      user_attributes[:mobile_phone] = mobile
      if session["omniauth.origin"] =~ /\?role=agent/
        user_attributes[:role_ids] = [Role.find_by(name: 'agent').id]
      end
      flag, user = User::Create.(user_attributes)
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
