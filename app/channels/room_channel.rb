class RoomChannel < ApplicationCable::Channel

  def subscribed
    # stream_from "some_channel"
    @room = Chat::Room.find(params[:id])
    RoomChannel.broadcast_to @room, message: "#{nickname}加入房间", type: 'system'
    stream_for @room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
    RoomChannel.broadcast_to @room, message: "#{nickname}离开房间", type: 'system'
  end

  def unsubscribe_from_channel
    unsubscribed
  end

  def say(data)
    Rails.logger.debug '%s say - %s' % [current_user, data]
    RoomChannel.broadcast_to @room, message: data['message'], type: 'message', nickname: nickname
  end

  def nickname
    current_user ? current_user.nickname : '游客'
  end
end
