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
    redis = Redis.current
    rooms = redis.keys("user-#{current_user.id}-room-*")
    push_messages = []
    rooms.each do |key|
      push_messages.push({id: key.split('room-')[1], count: redis.get(key)})
    end
    UserChannel.broadcast_to current_user, message: "#{push_messages.to_json}", type: 'room'
  end
end
