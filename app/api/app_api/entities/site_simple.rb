module AppAPI
  module Entities
    class SiteSimple < Base
      # public attributes
      expose_id
      expose :title, documentation: { desc: "#{::Site.model_name.human}名称" }
      expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItemSimple, as: :images, documentation: { is_array: true }
      expose :shares_count, documentation: { desc: '分享帖', type: Integer }
      expose :friends_count, documentation: { desc: '好友数', type: Integer }
      expose :favorites_count, documentation: { desc: '被私藏数', type: Integer }
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
    end
  end
end
