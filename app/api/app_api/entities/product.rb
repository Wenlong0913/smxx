module AppAPI
  module Entities
    class Product < Base

      # public attributes
      expose_id
      expose :name, documentation: { desc: '产品名称' }
      expose :sell_price, documentation: {desc: '产品卖价'}
      expose :site, using: AppAPI::Entities::Site, if: lambda { |instance, options| (options[:includes] || []).include?(:site) }
      # expose :site, using: AppAPI::Entities::Site, if: lambda { |instance, options| options[:type] != :full_site }
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images

      # full attributes
      with_options if: ->(product, options) { options[:type] == :full_product } do |f|
        expose :stock, documentation: { desc: '产品库存' }
        expose :unit, documentation: { desc: '库存单位' }
        expose :price, documentation: { desc: '产品原价' }
        expose :discount, documentation: { desc: '产品折后价' }
        expose :description, documentation: { desc: '产品的详细信息描述' }
        expose :is_fee, documentation: { desc: '是否有物流费用'}
        expose :shopping_fee, documentation: { desc: '物流费用'}
        expose :weight, documentation: { desc: '产品重量'}
        expose :weight_unit, documentation: { desc: '重量单位'}
        expose :product_special_attributes, documentation: { desc: '该产品信息特有的属性和值'}
      end

      def product_special_attributes
        psa = {}
        object.additional_attribute_keys.each_pair do |k, v|
          psa[v] = object.additional_attribute_values[k]
        end
        psa
      end

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
