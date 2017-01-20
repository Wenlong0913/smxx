class Api::BaseController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user
  end

  private

  def user_not_authorized
    render_failed('没有权限')
  end

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

  def render_base_data(base_data_json, base_data, page_size, list_type)
    {
      json_data: base_data_json,
      page_size: page_size,
      current_page: base_data.current_page,
      total_pages: base_data.total_pages,
      total_count: base_data.total_count,
      list_type: list_type
    }
  end
end
