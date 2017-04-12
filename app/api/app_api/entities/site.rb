module AppAPI
  module Entities
    class Site < SiteSimple
      expose :products, using: AppAPI::Entities::Product, documentation: { is_array: true }, if: ->(site, options) { (options[:includes] || []).include?(:products) }
      expose :shares_count, documentation: { desc: '分享帖', type: Integer }
      expose :friends_count, documentation: { desc: '好友数', type: Integer }
      expose :favorites_count, documentation: { desc: '被私藏数', type: Integer }

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
