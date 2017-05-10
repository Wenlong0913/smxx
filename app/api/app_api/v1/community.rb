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
        optional :longitude, type: Float, desc: '经度'
        optional :latitude, type: Float, desc: '纬度'
        all_or_none_of :longitude, :latitude
      end
      get do
        # binding.pry
        if params[:latitude] && params[:longitude]
          communities = ::Community.near_by(lat: params[:latitude], lng: params[:longitude], distance: 500)
          present communities, with: AppAPI::Entities::CommunitySimple
        else
          communities = ::Community.all
          communities = paginate_collection(sort_collection(communities), params)
          wrap_collection communities, AppAPI::Entities::CommunitySimple
        end
      end
      
    end
  end
end
