module AppAPI::V1
  class Product < Grape::API
    helpers AppAPI::SharedParams
    resources :products do

      desc '获取商品信息' do
        success AppAPI::Entities::Product
      end
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      get ':id' do
        authenticate!
        present ::Product.find(params[:id]), with: AppAPI::Entities::Product, type: :full_product
      end

      desc '商品的相关商品' do
        success AppAPI::Entities::ProductSimple.collection(meta: false)
      end
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      get ':id/relations' do
        product = ::Product.find_by(id: params[:id])
        error! '此商品不存在' unless product
        products = ::Product.where(catalog: product.catalog).where("id != ?", product.id).order("random()").limit(4)
        present products, with: AppAPI::Entities::ProductSimple
      end

      desc '获取商品列表' do
        success AppAPI::Entities::ProductSimple.collection
      end
      params do
        use :pagination
        # use :sort, fields: [:id, :created_at, :updated_at]
        optional :type, type: String, values: ['hot', 'new', 'favorites', 'favorites_of_mine', 'favorites_of_friends'], desc: '产品分类排行：最热门产品，最新上架产品，最私藏产品, 我私藏的产品, 好友们棒场(私藏)的商品'
        optional :site_id, type: Integer, desc: '店铺ID'
        optional :name, type: String, desc: '根据名字搜索产品'
        optional :search_type, type: String, values: ['bought', 'all'], desc: '产品搜索类型: 我买过的产品, 所有产品, 默认为所有产品'
        optional :includes, type: String, values: ['favoriters'], desc: '选择favoriters后允许返回捧场者头像'
      end
      get do
        authenticate!
        # 查看所有上架商品
        site = nil
        if params[:site_id]
          site = ::Site.find_by(id: params[:site_id])
          error! '该产品不存在' unless site
        end
        products = if site
          site.products
        else
          ::Product.all
        end
        products = products.where("features ->> 'is_shelves' = '1'") if Settings.project.sxhop?
        if params[:type]
          products =
            case params[:type]
            when 'hot' then products
            when 'new' then products.order("created_at DESC")
            when 'favorites' then products.joins(:favorites).group("items.id").order('COUNT(favorite_entries.id) DESC')
            when 'favorites_of_mine' then products.joins(:favorites).where(favorite_entries: {user_id: current_user.id})
            when 'favorites_of_friends' then products.joins(:favorites).where(favorite_entries: {user_id: current_user.friends})
            end
        end
        if params[:name]
          products = products.where("name like ?", "%#{params[:name]}%")
        end
        if params[:search_type] && params[:search_type] == 'bought'
          products = products.joins(:orders).where("orders.user_id =  ?", current_user.id)
        end
        products = paginate_collection(sort_collection(products), params)
        wrap_collection products, AppAPI::Entities::ProductSimple, includes: [params[:includes]]
      end

      desc '收藏商品'
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      post ':id/favorite' do
        authenticate!
        product = ::Product.find(params[:id])
        message = ''
        if current_user.favorites.tagged_to? product
          message = '已经收藏了此产品!'
        else
          current_user.favorites.tag_to! product
          message = '产品收藏成功!'
        end
        present message: message
      end

      desc '取消收藏商品'
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      delete ':id/favorite' do
        authenticate!
        product = ::Product.find(params[:id])
        if current_user.favorites.tagged_to? product
          current_user.favorites.untag_to! product
        end
        present message: '产品取消收藏成功!'
      end

      desc '商品点赞'
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      post ':id/like' do
        authenticate!
        product = ::Product.find(params[:id])
        message = ''
        if current_user.likes.tagged_to? product
          message = '已经点赞了此产品!'
        else
          current_user.likes.tag_to! product
          message = '产品点赞成功!'
        end
        present message: message
      end

      desc '取消点赞商品'
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      delete ':id/like' do
        authenticate!
        product = ::Product.find(params[:id])
        if current_user.likes.tagged_to? product
          current_user.likes.untag_to! product
        end
        present message: '产品取消点赞成功!'
      end

    end # end of resources
  end
end
