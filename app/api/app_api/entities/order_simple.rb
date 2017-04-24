module AppAPI
  module Entities
    class OrderSimple < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :code, documentation: { desc: '订单号' }
      expose :price, documentation: { desc: '价格', type: Float }
      expose :status, documentation: { desc: '状态' }
    end
  end
end
