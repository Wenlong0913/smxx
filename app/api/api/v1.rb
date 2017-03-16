module API::V1
  extend ActiveSupport::Concern
  included do
    version 'v1', using: :path, vendor: 'tmf'
    format :json

    mount API::V1::User
  end
end
