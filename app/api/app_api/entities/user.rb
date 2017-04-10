module AppAPI
  module Entities
    class User < Base

      # public attributes
      expose_id
      expose_created_at
      expose :nickname, documentation: { desc: '用户昵称' }
      expose :headshot, documentation: { desc: '头像' }
      expose :description, documentation: { desc: '用户自我介绍' }

      # private attributes
      with_options if: ->(user, options) { options[:type] == :private || options[:current_user].try(:id) == user.id } do |f|
        expose :username, documentation: { desc: '用户名：私有数据，自己或有特定权限的账号才能获得' }
        expose :email, documentation: { desc: '电子邮件：私有数据，自己或有特定权限的账号才能获得' }
        expose :mobile_phone, documentation: { desc: '私有数据，自己或有特定权限的账号才能获得' }
      end

      expose :site_favorites_count, documentation: { desc: '收藏的店铺数量，特定条件下才能获得' }, if: ->(user, options) { options[:site_favorites_count] }

      expose :product_favorites_count, documentation: { desc: '收藏的产品数量，特定条件下才能获得' }, if: ->(user, options) { options[:product_favorites_count] }

      # TODO: 分享的帖子数量，特定条件下才能获得
      expose :article_shares_count, documentation: { desc: '分享的帖子数量，特定条件下才能获得（功能未实现，始终返回0）' }, if: ->(user, options) { options[:article_shares_count] }

      expose :access_token, if: :access_token, documentation: { desc: '用户身份，在注册或登录时返回' } do |user, options|
        options[:access_token]
      end

      def mobile_phone
        object.mobile.try(:phone_number)
      end

      def site_favorites_count
        object.site_favorites.count
      end

      def product_favorites_count
        object.product_favorites.count
      end

      def article_shares_count
        0
      end

      def headshot
        (object.avatar && object.avatar.url) || object.headshot
      end
    end
  end
end
