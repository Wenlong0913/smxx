module AppAPI::V1
  class Shop < Grape::API
    helpers AppAPI::SharedParams
    resources :shops do

      desc '获取店铺信息' do
        success AppAPI::Entities::Shop
      end
      params do
        requires :id, type: Integer, desc: '店铺ID'
      end
      get ':id' do
        authenticate!
        present ::Shop.find(params[:id]), with: AppAPI::Entities::Shop, includes: [:products]
        # AppAPI::Entities::Shop.represent(::Shop.find(params[:id]), only: [:title])
      end

      desc '获取店铺列表' do
        success AppAPI::Entities::Shop.collection
      end
      params do
        use :pagination
        # use :sort, fields: [:id, :created_at, :updated_at]
        optional :friends, type: Boolean, desc: '好友店铺'
        optional :favorite, type: String, values: ['private', 'friends', 'all'], desc: '私藏店铺：我的私藏店铺，好友私藏的店铺，被私藏数高的店铺'
      end
      get do
        authenticate!
        shops = ::Shop.all
        if params[:favorite]
          shops =
            case params[:favorite]
            when 'private' then shops.where(id: current_user.favorites.where(resource_type: 'Shop').map(&:resource_id))
            when 'friends' then shops.where(user_id: current_user.favorites.where(resource_type: 'User').map(&:resource_id))
            when 'all'     then shops.left_joins(:favorites).group("shops.id").order('COUNT(favorite_entries.id) DESC')
            end
        end
        shops = paginate_collection(sort_collection(shops), params)
        wrap_collection shops, AppAPI::Entities::Shop
      end

    end # end of resources
  end
end
