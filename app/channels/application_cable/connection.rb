module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private
    def find_user
      if request.params[:credential].present?
        api_token = ApiToken.find_by(token: request.params[:credential])
        api_token && api_token.user
      else
        request::env['warden'].user
      end
    end
  end
end
