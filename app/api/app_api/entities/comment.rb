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
      expose :comments_count, documentation: { desc: '本条评论的回复数' }
      expose :likes_count, documentation: { desc: '本条评论的点赞数' }

      def comments_count
        object.children.size
      end
    end
  end
end
