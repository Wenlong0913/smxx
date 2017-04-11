module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private
    def find_user
      User.find_by(username: request.params[:credential]) rescue nil
    end
  end
end
