class Api::BaseController < ActionController::API

  def current_user
    @current_user
  end

  private

  def authenticate!
    render_failed and return unless token?
    @current_user = User.find_by(id: auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  end

  def render_failed(messages = ['验证失败'])
    render json: { errors: messages}, status: :unauthorized
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= AuthToken.decode(http_token)
  end

  def token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
