class User
  Update =
    lambda do |user_or_id, attributes, user: nil|
      user = user_or_id.is_a?(User) ? user_or_id : User.find(user_or_id)
      user.assign_attributes attributes
      [user.save, user]
    end
end