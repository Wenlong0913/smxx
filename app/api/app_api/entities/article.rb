module AppAPI
  module Entities
    class Article < ArticleSimple
      expose :description, documentation: { desc: '文章内容' }, if: ->(article, options) { options.fetch(:includes, []).map(&:to_s).include?('description') }
      if Settings.project.sxhop?
        expose :products_simple, as: :products, if: ->(article, options) { options[:type] == :list }
        expose :products, using: AppAPI::Entities::ProductSimple, documentation: { is_array: true }, if: ->(article, options) { options[:type] != :list }
      end
      if Settings.project.imolin?
        expose :comments, using: AppAPI::Entities::Comment
      end
      expose_updated_at

      def products_simple
        object.products.as_json(only: [:id, :name], methods: :price, include: { image_items: { only: [], methods: [:image_url]} })
      end
    end
  end
end
