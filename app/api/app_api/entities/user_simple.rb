module AppAPI
  module Entities
    class UserSimple < Base
      # public attributes
      expose_id
      expose_created_at
      expose :nickname, documentation: { desc: '用户昵称' }
      expose :headshot, documentation: { desc: '头像' }
      def headshot
        (object.avatar && (Settings.site.host + object.avatar.url(:thumb))) || object.headshot
      end
    end
  end
end
