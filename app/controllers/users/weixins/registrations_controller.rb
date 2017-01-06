# 已注册用户绑定微信
# 未注册用户微信注册
class Users::Weixins::RegistrationsController < ApplicationController

  # 新建微信二维码登陆需要的URL
  def new
    unless current_user
      redirect_to user_wechat_omniauth_authorize_path(origin: request.original_url)
      return
    end
  end

  # 二维码
  def show
    p = {}
    # 登录用户绑定微信
    if params[:user_id]
      p[:user_id] = params[:user_id]
    # 只允许代理商注册
    elsif params[:role] && params[:role] == 'agent'
      p[:role] = params[:role]
    end
      
    qrcode = RQRCode::QRCode.new(new_users_weixins_registrations_url(p))
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

end