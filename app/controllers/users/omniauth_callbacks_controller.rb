class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def wechat
    auth = request.env["omniauth.auth"]

    cond = auth.extra.raw_info.unionid ? \
      User::Weixin.where("uid = ? OR unionid = ?", auth.uid, auth.extra.raw_info.unionid) : \
      User::Weixin.where(uid: auth.uid)

    weixin_user = cond.first || User::Weixin.new

    if current_user && !weixin_user.persisted?
      weixin_user = User::Weixin.process_weixin_user(current_user, auth)
    end

    if weixin_user.persisted?
      sign_in_and_redirect weixin_user.user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Wechat") if is_navigational_format?
    else
      session["devise.wechat_data"] = request.env["omniauth.auth"]
      session["omniauth.origin"] = request.env['omniauth.origin'] || '/'
      redirect_to sign_up_url
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    request.env['omniauth.origin'] || '/'
  end

end
