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
        success AppAPI::Entities::SiteSimple.collection
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
            when 'mine'    then sites.joins(:favorites).where(favorite_entries: {user_id: current_user.id})
            when 'friends' then sites.joins(:favorites).where(favorite_entries: {user_id: current_user.friends})
            when 'top3'    then sites.joins(:favorites).group("sites.id").order('COUNT(favorite_entries.id) DESC').limit(3)
            end
        end
        if params[:friends]
          # 获取好友店铺
          sites = ::Site.where(user_id: current_user.friends)
        end
        sites = paginate_collection(sort_collection(sites), params)
        wrap_collection sites, AppAPI::Entities::Site
      end

      desc '收藏店铺'
      params do
        requires :id, type: Integer, desc: "#{::Site.model_name.human}ID"
      end
      post ':id/favorite' do
        authenticate!
        site = ::Site.find(params[:id])
        message = ''
        if current_user.favorites.tagged_to? site
          message = '已经收藏了此店铺!'
        else
          current_user.favorites.tag_to! site 
          message = '店铺收藏成功!'
        end
        present message: message
      end

      desc '取消收藏店铺'
      params do
        requires :id, type: Integer, desc: "#{::Site.model_name.human}ID"
      end
      delete ':id/favorite' do
        authenticate!
        site = ::Site.find(params[:id])
        if current_user.favorites.tagged_to? site
          current_user.favorites.untag_to! site
        end
        present message: '店铺取消收藏成功!'
      end

    end # end of resources
  end
end
