module AppAPI
  module Entities
    class ProductSimple < Base
      expose_id
      expose :name, documentation: { desc: '产品名称' }
      expose :sell_price, documentation: {desc: '产品卖价', type: Float }
      expose :comments_count, documentation: {desc: '产品评论的数量', type: Integer }
      expose :favorites_count, documentation: {desc: '产品收藏的数量', type: Integer }
      expose :visits_count, documentation: {desc: '产品访问的数量', type: Integer }
      expose :likes_count, documentation: {desc: '产品喜爱的数量', type: Integer }
      expose :sales_count, documentation: {desc: '产品的销量', type: Integer }
      expose :site, using: AppAPI::Entities::SiteSimple
      expose :image_items, using: AppAPI::Entities::ImageItemSimple, documentation: { is_array: true }, as: :images
      with_options if: ->(products, options) { options.fetch(:includes, []).map(&:to_s).include?('favoriters') } do |f|
        expose :favoriters, documentation: { desc: "产品的捧场用户", is_array: true }
      end

      def favoriters
        object.favorites.as_json(only: [], include: { user: {only: [:nickname], methods: [:display_headshot]}})
      end
    end
  end
end
