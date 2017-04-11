module AppAPI
  module Entities
    class Site < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '店铺名称' }
      expose :description, documentation: { desc: '店铺详细描述' }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images
      expose :products, using: AppAPI::Entities::Product, if: ->(site, options) { (options[:includes] || []).include?(:products) }

      expose :user, using: AppAPI::Entities::User

      expose :share_count, documentation: { desc: '分享帖' }
      expose :friends_count, documentation: { desc: '好友数' }
      expose :favorite_count

      private
      def share_count
        object.products.joins(:articles).count
      end

      # TODO: 获取好友数量, 如何定义好友?, 如何获取好友?
      def friends_count
        0
      end

      def favorite_count
        object.favorites.count
      end

    end
  end
end