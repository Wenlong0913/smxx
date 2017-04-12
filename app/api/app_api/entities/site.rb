module AppAPI
  module Entities
    class Site < Base
      # public attributes
      expose_id

      expose :title, documentation: { desc: "#{::Site.model_name.human}名称" }
      expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images
      expose :products, using: AppAPI::Entities::Product, if: ->(site, options) { (options[:includes] || []).include?(:products) }

      expose :user, using: AppAPI::Entities::User

      expose :shares_count, documentation: { desc: '分享帖' }
      expose :friends_count, documentation: { desc: '好友数' }
      expose :favorites_count

      private
      def shares_count
        object.products.joins(:articles).count
      end

      def friends_count
        object.friends.count
      end

      def favorites_count
        object.favorites.count
      end

    end
  end
end
