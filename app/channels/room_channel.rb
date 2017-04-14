class RoomChannel < ApplicationCable::Channel

  def subscribed
    # stream_from "some_channel"
    @room = Chat::Room.find(params[:id])
    RoomChannel.broadcast_to @room, message: "#{user[:nickname]}加入房间", type: 'system'
    stream_for @room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
    RoomChannel.broadcast_to @room, message: "#{user[:nickname]}离开房间", type: 'system'
  end

  def unsubscribe_from_channel
    unsubscribed
  end

  def say(data)
    Rails.logger.debug '%s say - %s' % [current_user, data]
    @room.messages.create(text: data['message'], user: current_user) if current_user
    RoomChannel.broadcast_to @room, message: data['message'], type: 'message', user: user
  end

  def user
    current_user ? {nickname: current_user.nickname, id: current_user.id, avatar: current_user.headshot} : {nickname: '游客'}
  end
end
