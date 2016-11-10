class User
  Create =
    lambda do |attributes|
      user = User.new(attributes)
      [user.save, user]
    end
end