module AppAPI
  module Entities
    class UserSimple < Base
      # public attributes
      expose_id
      expose_created_at
      expose :nickname, documentation: { desc: '用户昵称' }
      expose :display_headshot, as: :headshot, documentation: { desc: '头像' }
    end
  end
end
