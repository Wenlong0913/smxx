module AppAPI::V1
  class Site < Grape::API
    helpers AppAPI::SharedParams
    resources :sites do

      desc "获取#{::Site.model_name.human}信息" do
        success AppAPI::Entities::Site
      end
      params do
        requires :id, type: Integer, desc: "#{::Site.model_name.human}ID"
      end
      get ':id' do
        authenticate!
        present ::Site.find(params[:id]), with: AppAPI::Entities::Site, type: :full_site, includes: [:products]
        # AppAPI::Entities::Site.represent(::Site.find(params[:id]), only: [:title])
      end

      desc "获取#{::Site.model_name.human}列表" do
        success AppAPI::Entities::Site.collection
      end
      params do
        use :pagination
        # use :sort, fields: [:id, :created_at, :updated_at]
        optional :friends, type: Boolean, desc: "好友#{::Site.model_name.human}"
        optional :favorite, type: String, values: ['mine', 'friends', 'top3'], desc: "私藏#{::Site.model_name.human}：我的私藏#{::Site.model_name.human}，好友私藏的#{::Site.model_name.human}，被私藏数高的#{::Site.model_name.human}top3"
      end
      get do
        authenticate!
        sites = ::Site.all
        if params[:favorite]
          sites =
            case params[:favorite]
            when 'mine' then sites.where(id: current_user.favorites.where(resource_type: 'Site').map(&:resource_id))
            when 'friends' then sites.where(id: User.joins(:favorites).where(resource_type: 'Site').where("users.id in ?", current_user.friends).pluck("resource_id"))
            when 'top3'     then sites.left_joins(:favorites).group("sites.id").order('COUNT(favorite_entries.id) DESC').limit(3)
            end
        end
        if params[:friends]
          # 获取好友店铺
          sites = ::Site.where(user_id: current_user.friends)
        end
        sites = paginate_collection(sort_collection(sites), params)
        wrap_collection sites, AppAPI::Entities::Site
      end

    end # end of resources
  end
end
