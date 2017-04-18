module AppAPI
  module Entities
    class Site < SiteSimple
      expose :products, using: AppAPI::Entities::Product, documentation: { is_array: true }, if: ->(site, options) { (options[:includes] || []).include?(:products) }
    end
  end
end
