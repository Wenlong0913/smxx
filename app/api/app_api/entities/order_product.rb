module AppAPI
  module Entities
    class OrderProduct < Base

      # public attributes
      expose_id
      expose :amount, documentation: { desc: '产品数量' }
      expose :price, documentation: { desc: '产品价格' }
    end
  end
end
