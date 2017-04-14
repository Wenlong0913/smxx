module AppAPI
  module Entities
    class ChatRoom < Base

      expose_id
      expose_created_at
      expose :name, documentation: { desc: '频道名称' }
    end
  end
end
