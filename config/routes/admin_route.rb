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

        resources :materials do # 物料管理
          collection do
            get 'dashboard', to: 'materials#dashboard'
          end
        end
        resources :vendors # 供应商管理

        resources :material_managements #物料出库/入库
        resources :material_warehouses # 物料仓库
        resources :material_management_histories, only: [:index] # 库存流水
        resources :material_stock_alerts, only: [:index] # 库存警报

        resources :roles, only: [:index], :concerns => :paginatable do
          resources :users, only: [:index], :concerns => :paginatable
        end

        resources :users, :concerns => :paginatable do
          collection do
            get 'dashboard', to: 'users#dashboard'
          end
        end
        namespace :user do
          resources :weixins, only: [:index, :show], :concerns => :paginatable
        end

        resources :products, :concerns => :paginatable do
          collection do
            get 'dashboard', to: 'products#dashboard'
          end
        end
        resources :sites, :concerns => :paginatable do
          resources :members, :concerns => :paginatable
          collection do
            get 'dashboard', to: 'sites#dashboard'
          end
        end

        resources :produces, only: [:index] do
          resources :tasks, only: [:create, :update]
        end
        resources :task_types, except: [:show]
        resources :orders, :concerns => :paginatable do
          resources :materials, except: [:index], controller: 'order_materials'
          resources :produces, only: [:show, :create, :destroy, :update]
        end
        #营销页
        resources :market_catalogs, :concerns => :paginatable
        resources :market_templates, :concerns => :paginatable
        catalog_resources_for MarketCatalog # 分类管理
        resources :market_pages, :concerns => :paginatable do
          collection do
            get 'dashboard', to: 'market_pages#dashboard'
          end
        end
        #客户CRM
        resources :member_catalogs, :concerns => :paginatable
        resources :members, :concerns => :paginatable do
          collection do
            get 'dashboard', to: 'members#dashboard'
          end
        end

      end
    end
  end
end
