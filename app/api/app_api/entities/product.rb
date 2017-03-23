module AppAPI
  module Entities
    class Product < Base

      # public attributes
      expose_id
      expose :name, documentation: { desc: '产品名称' }
      expose :price, documentation: {price: '价格'}
      expose :site, using: AppAPI::Entities::Site, if: lambda { |instance, options| (options[:includes] || []).include?(:site) }
      # expose :site, using: AppAPI::Entities::Site, if: lambda { |instance, options| options[:type] != :full_site }
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images

      # full attributes
      with_options if: ->(product, options) { options[:type] == :full_product } do |f|
        expose :stock, documentation: { desc: '商品库存' }
        expose :discount, documentation: { desc: '折后价' }
        expose :description, documentation: { desc: '商品的详细信息描述' }
        expose :shopping_fee, documentation: { desc: '物流费用'}
        expose :product_special_attributes, documentation: { desc: '该商品信息特有的属性和值'}
      end

      def product_special_attributes
        psa = {}
        object.additional_attribute_keys.each_pair do |k, v|
          psa[v] = object.additional_attribute_values[k]
        end
        psa
      end

    end
  end
end
