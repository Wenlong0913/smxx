module AppAPI::V1
  class Community < Grape::API
    helpers AppAPI::SharedParams
    resources :communities do
      desc '小区列表' do
        success success AppAPI::Entities::Common
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get do
        communities = ::Community.all
        communities = paginate_collection(sort_collection(communities), params)
        wrap_collection communities, AppAPI::Entities::Common
      end
      
    end
  end
end
