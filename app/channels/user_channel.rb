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
    user_id = 'user-' + current_user.id.to_s
    redis = Redis.current
    user_unread_messages = redis.get(user_id)
    user_unread_messages_json = user_unread_messages ? JSON.parse(user_unread_messages) : {}
    push_messages = []
    user_unread_messages_json.each_pair do |k, v|
      push_messages.push({id: k.split('room-')[1], count: v})
    end
    UserChannel.broadcast_to current_user, message: "#{push_messages.to_json}", type: 'room'
  end
end
