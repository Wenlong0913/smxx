# 已注册用户绑定微信
# 未注册用户微信注册
class Users::Weixins::RegistrationsController < ApplicationController

  # 新建微信二维码
  def new
    @message = ''
    # 已获取微信用户
    if params[:weixin_uid].present?
      weixin_user = User::Weixin.find_by_uid(params[:weixin_uid])
      user = User.find_by_uuid(params[:uuid]) if params[:uuid].present?
      if weixin_user
        # 绑定微信用户
        if user
          if weixin_user.user
            @message = '您已经绑定过微信号！'
          else
            weixin_user.user = user
            if weixin_user.save
              @message = '绑定成功！'
            else
              @message = weixin_user.errors.messages
            end
          end
        # 进入注册页面
        else
          session["params"] = qrcode_params
          redirect_to sign_up_url
          return
        end
      else
        @message = '用户不存在，请检查！'
      end
    else
      redirect_to user_wechat_omniauth_authorize_path(origin: request.original_url)
      return
    end
  end

  # 二维码
  def show
    qrcode = RQRCode::QRCode.new(new_users_weixins_registrations_url(qrcode_params))
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

  private
  def qrcode_params
    params.permit(:uuid, :role, :weixin_uid)
  end

end