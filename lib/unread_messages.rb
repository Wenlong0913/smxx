class UnreadMessages
  def initialize(room_id, user_id)
    @room = Chat::Room.find_by(id: room_id)  
    @current_user = User.find_by(id: user_id)
    @redis = Redis.current
  end

  def user_add_room
    room_id = 'room-' + @room.id.to_s
    room_users = @redis.get(room_id)
    if room_users
      room_users_json = JSON.parse(room_users)
      room_users_json["online_users"].push(@current_user.id)
      @redis.set(room_id, room_users_json.to_json)
    else
      room_users_json = {}
      room_users_json["online_users"] = [@current_user.id]
      @redis.set(room_id, room_users_json.to_json)
    end
    clear_user_unread_message(@current_user.id)
  end

  def user_leave_room
    room_id = 'room-' + @room.id.to_s
    room_users = @redis.get(room_id)
    if room_users
      room_users_json = JSON.parse(room_users)
      room_users_json["online_users"].delete(@current_user.id)
      @redis.set(room_id, room_users_json.to_json)
    end
  end

  def add_unread_message
    all_users =  @room.owner_type == 'Community' ? @room.owner.users.map(&:id) : []
    room_id = 'room-' + @room.id.to_s
    current_users = @redis.get(room_id)
    offline_users = []
    if current_users
      current_users_json = JSON.parse(current_users)
      offline_users = all_users.uniq - current_users_json["online_users"].uniq
    else
      offline_users = all_users
    end
    offline_users.each do |uid|
      add_user_unread_message(uid)
    end
  end

  def add_user_unread_message(user_id)
    user_with_id = 'user-' + user_id.to_s
    room_with_id = 'room-' + @room.id.to_s
    user_unread_messages = @redis.get(user_with_id)
    user_unread_messages_json = user_unread_messages ? JSON.parse(user_unread_messages) : {}
    user_unread_messages_json[room_with_id] = user_unread_messages_json[room_with_id] ? (user_unread_messages_json[room_with_id] + 1) : 1
    @redis.set(user_with_id, user_unread_messages_json.to_json)
    push_unread_message(user_id)
  end

  def push_unread_message(user_id)
    user = User.find(user_id)
    user_id = 'user-' + user_id.to_s
    user_unread_messages = @redis.get(user_id)
    user_unread_messages_json = user_unread_messages ? JSON.parse(user_unread_messages) : {}
    push_messages = []
    user_unread_messages_json.each_pair do |k, v|
      push_messages.push({id: k.split('room-')[1], count: v})
    end
    UserChannel.broadcast_to user, message: "#{push_messages.to_json}", type: 'room'
  end

  def clear_user_unread_message(user_id)
    user_with_id = 'user-' + user_id.to_s
    room_with_id = 'room-' + @room.id.to_s
    user_unread_messages = @redis.get(user_with_id)
    if user_unread_messages
      user_unread_messages_json = JSON.parse(user_unread_messages)
      user_unread_messages_json[room_with_id] = 0
      @redis.set(user_with_id, user_unread_messages_json.to_json)
    end
    push_unread_message(user_id)
  end
end