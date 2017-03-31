module AppAPI
  module Entities
    class Site < Base

      # public attributes
      expose_id
      expose :title, documentation: { desc: '店铺名称' }
      expose :contact_name, documentation: { desc: '联系人' }
      expose :contact_number, documentation: { desc: '联系电话' }
      expose :is_sign, documentation: { desc: '是否签约' }
      expose :site_hours, documentation: { desc: '营业时间' }
      
      expose :address, documentation: { desc: '地址' }
      expose :image_items, using: AppAPI::Entities::ImageItem, as: :images

      expose :products, using: AppAPI::Entities::Product, if: ->(site, options) { (options[:includes] || []).include?(:products) }
      # # product detail
      # with_options if: ->(site, options) { options[:type] == :full_site } do |f|
      #   expose :products, using: AppAPI::Entities::Product
      # end
    end
  end
end