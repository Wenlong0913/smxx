class User
  Create =
    lambda do |attributes|
      flag = false
      user = User.new(attributes)
      mobile_phone = attributes[:mobile_phone]
      if mobile_phone
        mobile = User::Mobile.find_or_initialize_by(phone_number: mobile_phone)
        if mobile.new_record?
          user.password ||= Devise.friendly_token[0,20]
          user.mobile = mobile
          flag = user.save
        else
          user.errors.add :mobile_phone, '手机号已经存在'
        end
      else
        flag = user.save
      end
      [flag, user]
    end
end
