module AppAPI
  module Entities
    class OrderSimple < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :code, documentation: { desc: '订单号' }
      # expose :price, documentation: { desc: '价格', type: Float }
      expose :status, documentation: { desc: '状态' }
      expose :display_price, as: :price, documentation: { desc: '产品价格', type: Float}

      def display_price
        object.price.to_f/100
      end
    end
  end
end
