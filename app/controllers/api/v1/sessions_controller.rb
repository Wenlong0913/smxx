class Api::V1::SessionsController < Api::BaseController

  def create
    user = User.find_by_phone_number(params[:username])
    if user.nil?
      render json: { errorMessage: '手机号不存在' }, status: :unauthorized
    elsif !user.valid_password?(params[:password])
      render json: { errorMessage: '密码错误' }, status: :unauthorized
    else
      render json: { user: user.as_json(only: [:nickname, :headshot]), token: user.token }
    end
  end

end
