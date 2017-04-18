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

      def sell_price
        if object.discount && object.discount < object.price
          object.discount
        else
          object.price
        end
      end
    end
  end
end
