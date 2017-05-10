module AppAPI
  module Entities
    class Site < SiteSimple
      expose :products, using: AppAPI::Entities::Product, documentation: { is_array: true }, if: ->(site, options) { (options[:includes] || []).include?(:products) }

      if Settings.project.imolin?
        expose :title, documentation: { desc: "#{::Site.model_name.human}名称"}
        expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
        expose :image_items, using: AppAPI::Entities::ImageItem, as: :images, documentation: { is_array: true }
        expose :business_hours, documentation: { desc: '营业时间' }
        expose :address_line, documentation: { desc: '地址' }
        expose :address_lat, documentation: {desc: '纬度'}
        expose :address_lng, documentation: {desc: '经度'}
        expose :phone, documentation: { desc: '联系电话' }
        expose :is_favorite do |site, options|
          site.favorites.tagged_by? options[:user_id]
        end
      end

      if Settings.project.meikemei?
        expose :contact_name, documentation: { desc: '联系人' }
        expose :contact_phone, documentation: { desc: '联系电话' }
        expose :is_sign, documentation: { desc: '是否签约' }
        expose :score, documentation: { desc: '星级评分' }
        expose :business_hours, documentation: { desc: '营业时间' }
        expose :content, documentation: { desc: '美容院介绍' }
        expose :title, documentation: { desc: "#{::Site.model_name.human}名称" }
        expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
        expose :image_items, using: AppAPI::Entities::ImageItem, as: :images, documentation: { is_array: true }
        expose :address, documentation: { desc: '地址' }
        expose :last_image do |site, options|
          site.image_items.last.try(:image_url)
        end
        expose :properties, documentation: { desc: '标签备注', is_array: true }
        expose :staffs, using: AppAPI::Entities::Staff, if: ->(site, options) { (options[:includes] || []).include?(:staffs) }, documentation: { is_array: true }

        def score
          BigDecimal(object.score.to_s).ceil
        end

        def properties
          object.properties.map{|p| ::Site::PROPERTIES[p.to_sym]}.compact
        end
      end

    end
  end
end
