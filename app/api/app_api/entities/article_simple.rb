module AppAPI
  module Entities
    class ArticleSimple < Base
      # public attributes
      expose_id
      expose_created_at
      expose :title, documentation: { desc: '文章标题' }
      expose :image_items, using: AppAPI::Entities::ImageItemSimple, documentation: { is_array: true }, as: :images
      expose :user, using: AppAPI::Entities::UserSimple
      if Settings.project.imolin?
        expose :tag_list, documentation: { is_array: true, desc: '文章标签'}
      end
    end
  end
end
