class Admin::ProfileController < Admin::BaseController
  skip_after_action :verify_authorized
  def show
  end

  def connect_weixin
    conn = Faraday.new(:url => 'http://wxopen.tanmer.com')
    response = conn.get('/wx/mp_auth/wx4c40bb18df07aafc/fetch_uid/%s' % params[:code])
    data = JSON.parse(response.body)
    if data['uid']
      current_user.weixin = User::Weixin.find_or_create_by(uid: data['uid'])
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
end
