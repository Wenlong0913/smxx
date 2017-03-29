module AppAPI
  module Entities
    class Site < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '店铺名称' }
      expose :description, documentation: { desc: '店铺详细描述' }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images

      expose :products, using: AppAPI::Entities::Product, if: ->(site, options) { (options[:includes] || []).include?(:products) }
      # # product detail
      # with_options if: ->(site, options) { options[:type] == :full_site } do |f|
      #   expose :products, using: AppAPI::Entities::Product
      # end
    end
  end
end