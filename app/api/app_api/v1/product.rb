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
        present ::Product.find(params[:id]), with: AppAPI::Entities::Product, type: :full_product, includes: [:site]
      end

      desc '获取商品列表' do
        success AppAPI::Entities::Product.collection
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get do
        products = paginate_collection(sort_collection(::Product.all), params)
        wrap_collection products, AppAPI::Entities::Product, includes: [:site]
      end

    end # end of resources
  end
end
