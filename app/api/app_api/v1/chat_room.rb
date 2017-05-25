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
          ::Chat::Room.find_or_create_by(name: community.name + '公共圈', owner: community) if rooms.empty?
          rooms = paginate_collection(rooms.where(owner: community), params)
        end
        wrap_collection rooms, AppAPI::Entities::ChatRoom
      end

      desc "创建频道" do
        success AppAPI::Entities::ChatRoom 
      end
      params do
        requires :name, type: String, desc: '频道名称'
      end
      post do
        authenticate!
        community = current_user.current_community if Settings.project.imolin?
        existed_chat_room = ::Chat::Room.where(name: params[:name])
        existed_chat_room = existed_chat_room.where(owner: community) if Settings.project.imolin?
        if existed_chat_room.blank?
          chat_room = ::Chat::Room.new(name: params[:name])
          chat_room.owner = community if Settings.project.imolin?
          error! chat_room.errors unless chat_room.save
          present chat_room, with: AppAPI::Entities::ChatRoom
        else
          present message: "圈子已经存在"
        end
      end

    end # end of resources
  end
end
