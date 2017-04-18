module AppAPI
  module Entities
    class Discover < Base

      # public attributes
      expose :resource_data, documentation: { desc: '内容' }

      private
      def resource_data
        if object.resource.class.to_s == 'Product'
          object.resource.as_json(only: [:id, :name], include: { image_items: { only: [:name], methods: [:image_url] } }).merge(discover_type: '商品')
        else
          object.resource.as_json(only: [:id, :url, :object_type, :object_id], include: { user: { only: [:nickname] } }).merge(discover_type: '分享贴')
        end
      end
    end
  end
end
