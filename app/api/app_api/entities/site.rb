module AppAPI
  module Entities
    class Site < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '店铺名称' }
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images
      expose :last_image do |site, options|
        site.image_items.last.try(:image_url)
      end
      expose :prop
      expose :products, using: AppAPI::Entities::Product, if: ->(site, options) { (options[:includes] || []).include?(:products) }
      # # product detail
      # with_options if: ->(site, options) { options[:type] == :full_site } do |f|
      #   expose :products, using: AppAPI::Entities::Product
      # end

      def prop
        object.properties.map{|p| object::PROPERTIES[p.to_sym]}
      end
    end
  end
end