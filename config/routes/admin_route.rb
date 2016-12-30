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

        resources :catalogs
        catalog_resources_for MaterialCatalog # 物料分类管理
        catalog_resources_for ProductCatalog
        resources :materials # 物料管理
        resources :vendors # 供应商管理

        resources :roles, only: [:index], :concerns => :paginatable do
          resources :users, only: [:index], :concerns => :paginatable
        end
        resources :users, :concerns => :paginatable
        resources :products, :concerns => :paginatable
        resources :sites, :concerns => :paginatable do
          resources :members, :concerns => :paginatable
        end
        resources :orders, :concerns => :paginatable
      end
    end
  end
end
