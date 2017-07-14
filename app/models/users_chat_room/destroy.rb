class UsersChatRoom
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(UsersChatRoom) ? record_or_id : UsersChatRoom.find(record_or_id)
      record.destroy
    end
end
