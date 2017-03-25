module AppAPI
  module Entities
    class ImageItem < Base

      # public attributes
      expose_id
      expose :image_url, documentation: { desc: '图片链接' }

    end
  end
end
