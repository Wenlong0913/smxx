module AppAPI
  module Entities
    class Article < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '文章标题' }
      expose :description, documentation: { desc: '文章内容' }
      expose :user, using: AppAPI::Entities::User
      with_options if: ->(article, options) { options[:type] == :full_article } do |f|
        expose :image_items, using: AppAPI::Entities::ImageItem, as: :images
        expose :products, using: AppAPI::Entities::Product
      end
    end
  end
end
