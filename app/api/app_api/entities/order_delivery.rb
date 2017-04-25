module AppAPI
  module Entities
    class OrderDelivery < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :logistics_name, documentation: { desc: '物流名称' }
      expose :logistics_number, documentation: { desc: '物流编号' }
    end
  end
end
