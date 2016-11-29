class User
  Update =
    lambda do |user_or_id, attributes, user: nil|
      flag = true
      user = user_or_id.is_a?(User) ? user_or_id : User.find(user_or_id)
      mobile_phone = attributes[:mobile_phone]
      if mobile_phone
        user.mobile.phone_number = mobile_phone
        flag = user.mobile.save
        user.errors.add :mobile_phone, user.mobile.errors.full_messages.join(', ') unless flag
      end
      user.assign_attributes attributes if flag
      [flag && user.save, user]
    end
end