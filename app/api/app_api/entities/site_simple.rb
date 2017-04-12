module AppAPI
  module Entities
    class SiteSimple < Base
      # public attributes
      expose_id
      expose :title, documentation: { desc: "#{::Site.model_name.human}名称" }
      expose :description, documentation: { desc: "#{::Site.model_name.human}详细描述" }, if: ->(site, options) { options[:type] == :full_site}
      expose :image_items, using: AppAPI::Entities::ImageItemSimple, as: :images, documentation: { is_array: true }
      expose :user, using: AppAPI::Entities::UserSimple
    end
  end
end
