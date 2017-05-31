class Admin::SessionsController < Admin::BaseController
  skip_before_action :ensure_admin_user!
  skip_after_action :verify_authorized
  def new
    @user = User.new
  end

  def weixin_login
    conn = Faraday.new(:url => 'http://wxopen.tanmer.com')
    response = conn.get('/wx/mp_auth/wx4c40bb18df07aafc/fetch_uid/%s' % params[:code])
    data = JSON.parse(response.body)
    if data['uid']
      wx_user = User::Weixin.find_by(uid: data['uid'])
      if wx_user
        sign_in wx_user.user
        render json: { success: true }
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end
end
