class User
  Update =
    lambda do |user_or_id, attributes, current_user = nil|
      flag = true
      user = user_or_id.is_a?(User) ? user_or_id : User.find(user_or_id)
      mobile_phone = attributes[:mobile_phone]

      if current_user
        role_ids = attributes[:role_ids]
        if role_ids
          if current_user.super_admin_or_admin?
            super_admin_id = Role.find_by(name: "super_admin").id
            admin_id = Role.find_by(name: "admin").id
            role_ids -= [super_admin_id]
            # 超级管理员 和 管理员自己 可以修改管理员角色
            if role_ids.include?(admin_id) && !current_user.has_role?('super_admin') && current_user.id != user.id
              role_ids -= [admin_id]
            end
            attributes[:role_ids] = role_ids
          else
            attributes.delete(:role_ids)
          end
        end
      end

      if mobile_phone
        user.mobile.phone_number = mobile_phone
        flag = user.mobile.save
        user.errors.add :mobile_phone, user.mobile.errors.full_messages.join(', ') unless flag
      end

      unless attributes["password"].present?
        attributes.delete("password")
        attributes.delete("password_confirmation")
      end

      user.assign_attributes attributes if flag

      [flag && user.save, user]
    end
end
