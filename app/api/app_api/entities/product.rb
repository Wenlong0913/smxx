module AppAPI
  module Entities
    class Product < ProductSimple
      # expose :site, using: AppAPI::Entities::Site, if: lambda { |instance, options| options[:type] != :full_site }

      # full attributes
      with_options if: ->(product, options) { options[:type] == :full_product } do |f|
        expose :stock, documentation: { desc: '产品库存', type: Integer }
        expose :unit, documentation: { desc: '库存单位' }
        expose :price, documentation: { desc: '产品原价', type: Float }
        expose :discount, documentation: { desc: '产品折后价', type: Float }
        expose :description, documentation: { desc: '产品的详细信息描述' }
        expose :is_fee, documentation: { desc: '是否有物流费用', type: Grape::API::Boolean }
        expose :shopping_fee, documentation: { desc: '物流费用', type: Float }
        expose :weight, documentation: { desc: '产品重量', type: Float}
        expose :weight_unit, documentation: { desc: '重量单位'}
        expose :product_special_attributes, documentation: { desc: '该产品信息特有的属性和值', type: Hash}
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
