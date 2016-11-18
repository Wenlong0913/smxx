class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def wechat
    weixin_user = User::Weixin.from_omniauth(request.env["omniauth.auth"])
    @user = process_user(weixin_user)
    # request.env['omniauth.origin']
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Wechat") if is_navigational_format?
    else
      session["wechat.uid"] = params[:uid] if params[:uid]
      session["devise.wechat_data"] = request.env["omniauth.auth"]
      session["omniauth.origin"] = request.env['omniauth.origin'] || '/'
      redirect_to sign_up_url
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    request.env['omniauth.origin'] || '/'
  end

  def process_user(weixin_user)
    weixin_user.user ||= current_user || User.new
    weixin_user.user.save
    weixin_user.user
  end

end
