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
        products = paginate_collection(sort_collection(products), params)
        wrap_collection products, AppAPI::Entities::Product, includes: [:site]
      end

    end # end of resources
  end
end
