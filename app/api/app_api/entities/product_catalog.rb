module AppAPI
  module Entities
    class ProductCatalog < Base

      # public attributes
      expose_id
      expose :name, documentation: { desc: '分类' }

    end
  end
end
