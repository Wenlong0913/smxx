module AppAPI
  module Entities
    class Order < OrderSimple
      expose :description, documentation: { desc: '订单描述备注信息'}
      expose :order_products, using: AppAPI::Entities::OrderProduct, documentation: { is_array: true }
      expose :order_deliveries, using: AppAPI::Entities::OrderDelivery, documentation: { desc: '订单物流信息', is_array: true }
      if Settings.project.meikemei?
        expose :service_time
        expose :staff

        def staff
          ::Staff.find_by(id: object.staff_id).as_json(only: [:title], methods: [:headshot])
        end
      end
    end
  end
end
