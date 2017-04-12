module AppAPI
  module Entities
    class ProductSimple < Base
      expose_id
      expose :name, documentation: { desc: '产品名称' }
      expose :sell_price, documentation: {desc: '产品卖价', type: Float }
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
