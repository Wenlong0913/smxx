module AppAPI::V1
  class ChatRoom < Grape::API
    helpers AppAPI::SharedParams
    resources :rooms do

      desc '频道列表' do
        success AppAPI::Entities::ChatRoom.collection
      end
      params do
        requires :community_id, type: Integer, desc: '小区ID'
        use :pagination
      end
      get do
        authenticate!
        community = ::Community.find(params[:community_id])
        rooms = paginate_collection(::Chat::Room.all.where(owner: community), params)
        wrap_collection rooms, AppAPI::Entities::ChatRoom
      end

      desc "创建频道" do
        success AppAPI::Entities::ChatRoom 
      end
      params do
        requires :community_id, type: Integer, desc: '小区ID'
        requires :name, type: String, desc: '频道名称'
      end
      post do
        authenticate!
        community = ::Community.find(params[:community_id])
        chat_room = ::ChatRoom.new(name: params[:name], owner: community)
        error! chat_room.errors unless chat_room.save
        present chat_room, with: AppAPI::Entities::ChatRoom
      end

    end # end of resources
  end
end
