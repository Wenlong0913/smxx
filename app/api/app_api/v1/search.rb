module AppAPI::V1
  class Search < Grape::API
    helpers AppAPI::SharedParams
    resources :search do

      desc '搜索列表' do
        success AppAPI::Entities::SiteCatalog
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        requires :name, type: String, desc: '分类,产品名称模糊搜索'
      end
      get do
        # 查看所有分类
        site_catalogs = ::SiteCatalog.where("name like ?", "%#{params[:name]}%")
        site_catalogs = paginate_collection(sort_collection(site_catalogs), params)
        sites = ::Site.where("title like ?", "%#{params[:name]}%")
        sites = paginate_collection(sort_collection(sites), params)

        present data: {
          catalog: site_catalogs.as_json(only: [:id, :name]),
          site: sites.as_json(only: [:id, :title], include: [image_items: {only: [:id], methods: [:image_url]}])
        }
      end

    end # end of resources
  end
end
