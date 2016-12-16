class User
  Update =
    lambda do |user_or_id, attributes, current_user = nil|
      flag = true
      user = user_or_id.is_a?(User) ? user_or_id : User.find(user_or_id)
      mobile_phone = attributes[:mobile_phone]

      if current_user
        role_ids = attributes[:role_ids]
        if role_ids
          role_ids.each do |role_id|
            next if role_id.blank?
            # 没有人可以分配超级管理员的角色
            role_ids.delete(role_id) if Role.find_by(id: role_id).try(:name) == 'super_admin'
            # 只有超级管理员可以分配管理员的角色
            role_name = Role.find(role_id).name
            unless current_user.has_role?('super_admin')
              role_ids.delete(role_id) if role_name == 'admin'
            end
            attributes[:role_ids] = role_ids
          end
        end
      end

      if mobile_phone
        user.mobile.phone_number = mobile_phone
        flag = user.mobile.save
        user.errors.add :mobile_phone, user.mobile.errors.full_messages.join(', ') unless flag
      end

      user.assign_attributes attributes if flag

      [flag && user.save, user]
    end
end
