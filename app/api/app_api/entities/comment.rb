module AppAPI
  module Entities
    class Comment < Base

      # public attributes
      expose_id
      expose_created_at
      expose_updated_at
      expose :content, documentation: { desc: '内容' }
      expose :user, using: AppAPI::Entities::UserSimple
      expose :parent_id, documentation: { desc: '父级评论ID' }
    end
  end
end
