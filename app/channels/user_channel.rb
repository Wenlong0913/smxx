class UserChannel < ApplicationCable::Channel

  def subscribed
    # stream_from "some_channel"
    Rails.logger.debug '%s - %s' % [current_user, '登录']
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def push_message
    community = current_user.current_community
    if community && community.chat_rooms.any?
      room_with_unread_messages_count = []
      community.chat_rooms.each do |room|
        last_message_id = UsersChatRoom.where(user_id: current_user.id, chat_room_id: room.id).first.try(:last_message_id) || 0
        unread_messages_count = room.messages.count - room.messages.where("id <= ?", last_message_id).count
        room_with_unread_messages_count.push({id: room.id, count: unread_messages_count})
      end
      UserChannel.broadcast_to current_user, message: "#{room_with_unread_messages_count.to_json}", type: 'room'
    end
  end
end
