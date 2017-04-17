module AppAPI
  module Entities
    class Site < SiteSimple
      expose :products, using: AppAPI::Entities::Product, documentation: { is_array: true }, if: ->(site, options) { (options[:includes] || []).include?(:products) }
      expose :shares_count, documentation: { desc: '分享帖', type: Integer }
      expose :friends_count, documentation: { desc: '好友数', type: Integer }
      expose :favorites_count, documentation: { desc: '被私藏数', type: Integer }

      Settings.project.meikemei?
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
        expose :properties, documentation: { desc: '标签备注' }, documentation: { is_array: true }
        expose :staffs, using: AppAPI::Entities::Staff, if: ->(site, options) { (options[:includes] || []).include?(:staffs) }, documentation: { is_array: true }
      end
      # # product detail
      # with_options if: ->(site, options) { options[:type] == :full_site } do |f|
      #   expose :products, using: AppAPI::Entities::Product
      # end
      def score
        BigDecimal(object.score.to_s).ceil
      end

      def properties
        object.properties.map{|p| ::Site::PROPERTIES[p.to_sym]}.compact
      end

      private
      def shares_count
        object.products.joins(:articles).count
      end

      def friends_count
        object.friends.count
      end

      def favorites_count
        object.favorites.count
      end


    end
  end
end
