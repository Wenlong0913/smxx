module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private
    def find_user
      api_token = ApiToken.find_by(token: request.params[:credential])
      api_token && api_token.user
    end
  end
end
