module AppAPI
  module Entities
    class Comment < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :content, documentation: { desc: '内容' }
      expose :user, using: AppAPI::Entities::UserSimple
    end
  end
end
