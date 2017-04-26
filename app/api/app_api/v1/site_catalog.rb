module AppAPI::V1
  class SiteCatalog < Grape::API
    helpers AppAPI::SharedParams
    resources :site_catalogs do

      desc '获取分类信息' do
        success AppAPI::Entities::SiteCatalog
      end
      params do
        requires :id, type: Integer, desc: '分类ID'
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get ':id' do
        site_catalog = ::SiteCatalog.find(params[:id])
        present site_catalog, with: AppAPI::Entities::SiteCatalog
        wrap_collection site_catalog.sites, AppAPI::Entities::Site
      end

      desc '获取分类列表' do
        success AppAPI::Entities::SiteCatalog.collection
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        optional :name, type: String, desc: '分类名称模糊搜索'
      end
      get do
        # 查看所有分类
        if params[:name]
          product_catalogs = ::SiteCatalog.where("name like ?", "%#{params[:name]}%")
          product_catalogs = paginate_collection(sort_collection(product_catalogs), params)
          wrap_collection product_catalogs, AppAPI::Entities::SiteCatalog
        else
          product_catalogs = ::SiteCatalog.where(parent_id: nil)
          product_catalogs = paginate_collection(sort_collection(product_catalogs), params)
          wrap_collection product_catalogs, AppAPI::Entities::SiteCatalog, includes: [:children]
        end
      end

    end # end of resources
  end
end
