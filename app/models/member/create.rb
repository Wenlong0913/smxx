class Member
  Create =
    lambda do |attributes, user: nil|
      flag = false
      mobile_phone = attributes.delete(:mobile_phone)
      record = Member.new(attributes)
      if mobile_phone
        mobile = User::Mobile.where(phone_number: mobile_phone).first
        if mobile
          record.user = mobile.user
          flag = record.save
        else
          attributes[:name] = "用户:" + mobile_phone unless attributes[:name]
          user_flag, user = User::Create.(nickname: attributes[:name], mobile_phone: mobile_phone)
          if user_flag
            record.user = user
            flag = record.save
          else
            record.errors.add(:phone_number, user.errors.messages[:mobile_phone])
          end
        end
      else
        record.errors.add(:phone_number, '手机号不能为空！')
      end
      [flag, record]
    end
end
