module AppAPI
  module Entities
    class AddressBook < Base
      expose :name, documentation: { desc: '收货人' }
      expose :mobile_phone, documentation: { desc: '联系电话'}
      expose :full_address, documentation: { desc: '收货地址'}
      expose_updated_at

    end
  end
end
