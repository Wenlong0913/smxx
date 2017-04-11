module AppAPI::V1
  extend ActiveSupport::Concern
  included do
    version 'v1', using: :path, vendor: 'tmf'
    format :json
    mount AppAPI::V1::Order
    mount AppAPI::V1::ShoppingCart
    mount AppAPI::V1::Product
    mount AppAPI::V1::Comment
    mount AppAPI::V1::Site
    mount AppAPI::V1::User
  end
end
