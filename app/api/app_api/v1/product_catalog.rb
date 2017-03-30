module AppAPI::V1
  class ProductCatalog < Grape::API
    helpers AppAPI::SharedParams
    resources :product_catalogs do

      # API描述
      desc '获取分类' do
        success AppAPI::Entities::ProductCatalog
      end
      # 通过ID查询所属分类
      params do 
        use :pagination
        requires :id, type: String, desc: '分类名称'
      end
      # get 获取
      get ':id' do
        authenticate!
        present ::ProductCatalog.find(params[:id]), with: AppAPI::Entities::ProductCatalog, includes: [:products]
      end

    end
  end
end