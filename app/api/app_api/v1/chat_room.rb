module AppAPI::V1
  class ChatRoom < Grape::API
    helpers AppAPI::SharedParams
    resources :rooms do

      desc '频道列表' do
        success AppAPI::Entities::ChatRoom
      end
      params do
        use :pagination
      end
      get do
        # authenticate!
        rooms = ::Chat::Room.all
        present rooms, with: AppAPI::Entities::ChatRoom
      end

    end # end of resources
  end
end
