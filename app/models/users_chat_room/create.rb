class UsersChatRoom
  Create =
    lambda do |attributes, user: nil|
      record = UsersChatRoom.new(attributes)
      [record.save, record]
    end
end
