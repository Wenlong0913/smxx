module AppAPI
  module Entities
    class SiteSimple < Base
      # public attributes
      expose_id
      expose :title, documentation: { desc: "#{::Site.model_name.human}名称" }
      expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItemSimple, as: :images, documentation: { is_array: true }

      if Settings.project.imolin?
        expose :comments_count, documentation: { desc: '评论数', type: Integer}
        expose :site_catalog_name, documentation: { desc: '分类名称', type: String}
        expose :avg_price
      end

      if Settings.project.sxhop?
        expose :shares_count, documentation: { desc: '分享帖', type: Integer }
        expose :friends_count, documentation: { desc: '好友数', type: Integer }
        expose :favorites_count, documentation: { desc: '被私藏数', type: Integer }
      end

      expose :user, using: AppAPI::Entities::UserSimple

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

      def comments_count
        object.products.sum(&:comments_count)
      end

      def site_catalog_name
        object.catalog.try(:name)
      end
      
    end
  end
end
