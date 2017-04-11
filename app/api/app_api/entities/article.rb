module AppAPI
  module Entities
    class Article < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '文章标题' }
      expose :description, documentation: { desc: '文章内容' }
      expose :author, documentation: { desc: '作者' }
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images
      expose :products, using: AppAPI::Entities::Product
    end
  end
end
