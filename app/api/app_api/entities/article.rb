module AppAPI
  module Entities
    class Article < ArticleSimple
      expose :description, documentation: { desc: '文章内容' }
      expose :products, using: AppAPI::Entities::ProductSimple, documentation: { is_array: true }
      expose_updated_at
    end
  end
end
