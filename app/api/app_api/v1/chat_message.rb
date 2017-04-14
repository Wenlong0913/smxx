module AppAPI::V1
  class ChatMessage < Grape::API
    helpers AppAPI::SharedParams
    resources :messages do

      desc '聊天消息历史记录' do
        success AppAPI::Entities::ChatMessage
      end
      params do
        use :pagination
        requires :room_id, type: Integer, desc: '频道ID'
      end
      get do
        # authenticate!
        messages = paginate_collection(::Chat::Message.where(room_id: params[:room_id]), params)
        wrap_collection messages, AppAPI::Entities::ChatMessage
      end

      # desc '聊天回复' do
      # end
      # params do
      #   requires :room_id, type: Integer, desc: '频道ID'
      #   requires :user_id, type: Integer, desc: '发送用户ID'
      #   requires :test, type: String, desc: '消息内容'
      # end
      # post do
      #   room = ::Chat::Room.find_by(id: params[:room_id])
      #   error! '频道不存在' unless room
      #
      # end

    end # end of resources
  end
end
