class UnreadMessages
  def initialize(room_id, user_id)
    @room = Chat::Room.find_by(id: room_id)
    @room_id = "room-#{@room.id.to_s}"  
    @current_user = User.find_by(id: user_id)
    @redis = Redis.current
  end

  def user_add_room
    @redis.sadd(@room_id, @current_user.id)
    clear_user_unread_message(@current_user.id)
  end

  def user_leave_room
    @redis.srem(@room_id, @current_user.id)
  end

  def add_unread_message
    all_users =  @room.owner_type == 'Community' ? @room.owner.users.map(&:id) : []
    current_users = @redis.smembers(@room_id)
    offline_users = []
    if current_users
      offline_users = all_users.uniq.map(&:to_s) - current_users
    else
      offline_users = all_users
    end
    offline_users.each do |uid|
      add_user_unread_message(uid)
    end
  end

  def add_user_unread_message(user_id)
    user_room_unread_message_key = "user-#{user_id}-room-#{@room.id}"
    user_room_unread_message_count = @redis.get(user_room_unread_message_key) || 0
    @redis.set(user_room_unread_message_key, user_room_unread_message_count.to_i + 1)
    push_unread_message(user_id)
  end

  def push_unread_message(user_id)
    user = User.find(user_id)
    rooms = @redis.keys("user-#{user_id}-room-*")
    push_messages = []
    rooms.each do |key|
      push_messages.push({id: key.split('room-')[1], count: @redis.get(key)})
    end
    UserChannel.broadcast_to user, message: "#{push_messages.to_json}", type: 'room'
  end

  def clear_user_unread_message(user_id)
    user_room_unread_message_key = "user-#{user_id}-room-#{@room.id}"
    @redis.set(user_room_unread_message_key, 0)
    push_unread_message(user_id)
  end
end