module AppAPI
  module Entities
    class OrderDelivery < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      if Settings.project.imolin?
        expose :delivery_username, documentation: { desc: '收货人' }
        expose :delivery_phone, documentation: { desc: '联系方式' }
        expose :delivery_address, documentation: { desc: '收货地址' }
      end
      if Settings.project.sxhop?
        expose :logistics_name, documentation: { desc: '物流名称' }
        expose :logistics_number, documentation: { desc: '物流编号' }
      end
    end
  end
end
