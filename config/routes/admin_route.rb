module AdminRoute
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        get "/static_pages/*id" => 'static_pages#show', as: :page, format: false
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        namespace :tracker do
          get '/', to: 'home#index'
          namespace :visits do
            resource :statistics, only: [:show]
            resource :details, only: [:show]
          end
          namespace :shares do
            get '/', to: 'home#show'
          end
        end

        resources :catalogs # 分类管理
        catalog_resources_for ProductCatalog # 产品分类管理
        catalog_resources_for MaterialCatalog # 物料分类管理

        resources :materials # 物料管理
        resources :vendors # 供应商管理

        resources :material_managements #物料出库/入库
        resources :material_warehouses # 物料仓库
        resources :material_management_histories, only: [:index] # 库存流水
        resources :material_stock_alerts, only: [:index] # 库存警报

        resources :roles, only: [:index], :concerns => :paginatable do
          resources :users, only: [:index], :concerns => :paginatable
        end

        resources :users, :concerns => :paginatable
        namespace :user do
          resources :weixins, only: [:index, :show], :concerns => :paginatable
        end

        resources :products, :concerns => :paginatable
        resources :sites, :concerns => :paginatable do
          resources :members, :concerns => :paginatable
        end
        resources :produces, only: [:index] do
          resources :tasks, only: [:create, :update]
        end
        resources :task_types, except: [:show]
        resources :orders, :concerns => :paginatable do
          resources :materials, except: [:index], controller: 'order_materials'
          resources :produces, only: [:show, :create, :destroy, :update]
        end
      end
    end
  end
end
