module AdminRoute
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        get "/static_pages/*id" => 'static_pages#show', as: :page, format: false
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        post 'sign_in_with_weixin', to: 'sessions#weixin_login', as: 'sign_in_with_weixin'
        get 'profile', to: 'profile#show'
        post 'profile/connect_weixin', to: 'profile#connect_weixin'
        namespace :tracker do
          get '/', to: 'home#index'
          namespace :visits do
            resource :statistics, only: [:show]
            resource :details, only: [:show]
          end
          resources :shares, only: [:index] do
            collection do
              post "chart_data"
            end
            resources :two_shares, only: [:index] do
              resources :three_shares, only: [:index]
            end
          end
        end
        # 社区
        resources :communities, :concerns => :paginatable do
          resources :articles
        end
        resources :articles # 公告管理（imolin）
        resources :catalogs # 分类管理
        catalog_resources_for ProductCatalog # 产品分类管理
        catalog_resources_for MaterialCatalog # 物料分类管理
        catalog_resources_for SiteCatalog # 物料分类管理

        resources :materials do # 物料管理
          collection do
            get 'dashboard', to: 'materials#dashboard'
          end
        end
        resources :vendors # 商家管理

        resources :material_managements #物料出库/入库
        resources :material_warehouses # 物料仓库
        resources :material_management_histories, only: [:index] # 库存流水
        resources :material_stock_alerts, only: [:index] # 库存警报
        resources :material_purchases, only: [:index]

        resources :roles, only: [:index], :concerns => :paginatable do
          resources :users, only: [:index], :concerns => :paginatable
          member do
            get 'edit_permission'
            put 'update_permission'
          end
        end

        resources :users, :concerns => :paginatable do
          collection do
            get 'dashboard', to: 'users#dashboard'
          end
          member do
            get 'edit_permission'
            put 'update_permission'
          end
          resources :address_books
        end
        namespace :user do
          resources :weixins, only: [:index, :show], :concerns => :paginatable
        end

        resources :products, :concerns => :paginatable, only: [:index] do
          collection do
            get 'dashboard', to: 'products#dashboard'
          end
        end
        resources :sites, :concerns => :paginatable do
          resources :members, :concerns => :paginatable
          resources :products, :concerns => :paginatable
          collection do
            get 'dashboard', to: 'sites#dashboard'
          end
        end

        if Settings.project.meikemei?
          resources :staffs, :concerns => :paginatable do
            resources :members, :concerns => :paginatable
            collection do
              get 'dashboard', to: 'staffs#dashboard'
            end
          end
        end

        resources :produces, only: [:index] do
          resources :tasks, only: [:create, :update]
        end
        resources :task_types, except: [:show]
        resources :deliveries, except: [:show]
        resources :order_deliveries, only: [:index]
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
        #系统参数
        resources :keystores
        resources :staffs

        #美容院
        if Settings.project.meikemei?
          resources :shops
          resources :shop_sites
        end

        resources :audits, only: [:index], :concerns => :paginatable do
          collection do
            get 'statistics'
          end
        end

        # 轮波图
        resources :banners
        resources :finance_histories, only: [:index, :new, :create, :show], :concerns => :paginatable
        resources :agent_plans
      end
    end
  end
end
