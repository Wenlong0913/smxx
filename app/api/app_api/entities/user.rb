module AppAPI
  module Entities
    class User < Base

      # public attributes
      expose_id
      expose_created_at
      expose :nickname, documentation: { desc: '用户昵称' }
      expose :headshot, documentation: { desc: '头像' }

      # private attributes
      with_options if: ->(user, options) { options[:type] == :private || options[:current_user].try(:id) == user.id } do |f|
        expose :username, documentation: { desc: '用户名：私有数据，自己或有特定权限的账号才能获得' }
        expose :email, documentation: { desc: '电子邮件：私有数据，自己或有特定权限的账号才能获得' }
        expose :mobile_phone, documentation: { desc: '私有数据，自己或有特定权限的账号才能获得' }
      end

      expose :access_token, if: :access_token, documentation: { desc: '用户身份，在注册或登录时返回' } do |user, options|
        options[:access_token]
      end

      def mobile_phone
        object.mobile.try(:phone_number)
      end
    end
  end
end
