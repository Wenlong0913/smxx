module AppAPI
  module Entities
    class Order < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :price, documentation: { desc: '价格' }
      expose :status, documentation: { desc: '状态' }
      expose :description, documentation: { desc: '订单描述备注信息'}

      expose :order_products, using: AppAPI::Entities::OrderProduct, if: lambda { |instance, options| (options[:includes] || []).include?(:order_products) }
      expose :products, using: AppAPI::Entities::Product, if: lambda { |instance, options| (options[:includes] || []).include?(:products) }

    end
  end
end
