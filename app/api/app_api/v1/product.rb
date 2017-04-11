module AppAPI::V1
  class Product < Grape::API
    helpers AppAPI::SharedParams
    resources :products do

      desc '获取商品信息' do
        success AppAPI::Entities::Product
      end
      params do
        requires :id, type: Integer, desc: '店铺ID'
      end
      get ':id' do
        authenticate!
        present ::Product.find(params[:id]), with: AppAPI::Entities::Product, type: :full_product, includes: [:site]
      end

      desc '获取商品列表' do
        success AppAPI::Entities::Product.collection
      end
      params do
        use :pagination
        # use :sort, fields: [:id, :created_at, :updated_at]
        optional :type, type: String, values: ['hot', 'new', 'favorite'], desc: '产品分类排行：最热门产品，最新上架产品，最私藏产品'
        optional :name, type: String, desc: '根据名字搜索产品'
        optional :search_type, type: String, values: ['bought', 'all'], desc: '产品搜索类型: 我买过的产品, 所有产品, 默认为所有产品'
      end
      get do
        authenticate!
        # 查看所有上架商品
        products = ::Product.where("features ->> 'is_shelves' = '1'")
        if params[:type]
          products = 
            case params[:type]
            when 'hot' then products
            when 'new' then products.order("created_at DESC")
            when 'favorite' then products.left_joins(:favorites).group("items.id").order('COUNT(favorite_entries.id) DESC')
            end
        end
        if params[:name]
          products = products.where("name like ?", "%#{params[:name]}%")
        end
        if params[:search_type] && params[:search_type] == 'bought'
          product_ids = current_user.orders.joins(:products).pluck(:product_id).uniq
          products = products.where(id: product_ids)
        end
        products = paginate_collection(sort_collection(products), params)
        wrap_collection products, AppAPI::Entities::Product, includes: [:site]
      end

    end # end of resources
  end
end
