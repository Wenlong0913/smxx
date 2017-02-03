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
      # user_attributes[:role_ids] = Role.where(name: 'agent').map(&:id) if session["agent"]
      flag, user = User::Create.(user_attributes)
      if flag
        if session["weixin_uid"]
          weixin_user = User::Weixin.find_by_uid(session["weixin_uid"])
          weixin_user.user = user
          weixin_user.save!
          session["weixin_uid"] = nil
        end
        sign_in user, :event => :authentication #this will throw if @user is not activate
        render json: {}
      else
        render json: {error: '创建失败了，请检查！'}
      end
    else
      render json: {error: '验证码不正确！'}
    end

  end

end
