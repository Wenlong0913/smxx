class User
  Create =
    lambda do |attributes|
      flag = false
      user = nil
      mobile_phone = attributes.delete(:mobile_phone)
      if mobile_phone
        mobile = User::Mobile.find_or_initialize_by(phone_number: mobile_phone)
        mobile.user ||= User.new{|u| u.password =  Devise.friendly_token[0,20]}
        mobile.user.mobile_phone  = mobile_phone
        flag = mobile.user.save
        user = mobile.user
      else
        user = User.new(attributes)
        flag = user.save
      end
      [flag, user]
    end
end