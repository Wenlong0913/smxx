module AppAPI
  module Entities
    class Article < ArticleSimple
      expose :description, documentation: { desc: '文章内容' }, if: ->(article, options) { options.fetch(:includes, []).map(&:to_s).include?('description') }
      expose :products_simple, as: :products, if: ->(article, options) { options[:type] == :list }
      expose :products, using: AppAPI::Entities::ProductSimple, documentation: { is_array: true }, if: ->(article, options) { options[:type] != :list }
      expose_updated_at

      def products_simple
        object.products.as_json(only: [:name], methods: :price, include: { image_items: { only: [], methods: [:image_url]} })
      end
    end
  end
end
