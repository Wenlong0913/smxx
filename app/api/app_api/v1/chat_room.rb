module AppAPI::V1
  class ChatRoom < Grape::API
    helpers AppAPI::SharedParams
    resources :rooms do

      desc '频道列表' do
        success AppAPI::Entities::ChatRoom.collection
      end
      params do
        if Settings.project.imolin?
          requires :community_id, type: Integer, desc: '小区ID'
        end
        use :pagination
      end
      get do
        authenticate!
        rooms = ::Chat::Room.all
        if Settings.project.imolin?
          community = ::Community.find(params[:community_id])
          rooms = paginate_collection(rooms.where(owner: community), params)
        end
        wrap_collection rooms, AppAPI::Entities::ChatRoom
      end

      desc "创建频道" do
        success AppAPI::Entities::ChatRoom 
      end
      params do
        if Settings.project.imolin?
          requires :community_id, type: Integer, desc: '小区ID'
        end
        requires :name, type: String, desc: '频道名称'
      end
      post do
        authenticate!
        chat_room = ::ChatRoom.new(name: params[:name])
        if Settings.project.imolin?
          community = ::Community.find(params[:community_id])
          chat_room.owner = community
        end
        error! chat_room.errors unless chat_room.save
        present chat_room, with: AppAPI::Entities::ChatRoom
      end

    end # end of resources
  end
end
