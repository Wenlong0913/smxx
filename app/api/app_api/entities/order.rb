module AppAPI
  module Entities
    class Order < OrderSimple
      expose :description, documentation: { desc: '订单描述备注信息'}
      expose :order_products, using: AppAPI::Entities::OrderProduct, documentation: { is_array: true }
    end
  end
end
