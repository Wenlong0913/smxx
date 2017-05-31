module AgentBackendRoute
  def self.extended(router)
    router.instance_exec do
      namespace :agent do
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        get 'assets/index'
        get 'assets/intranet_images'
        get 'assets/extranet_images'

        resources 'sites'
        resources 'products' do
          commentable
          member do
            post 'process_shelves'
            post 'sales_distribution'
          end
        end
        resources 'orders' do
          member do
            put :order_delivery
          end
        end
        resources 'statistics'

        resources 'members' do
          resources 'member_notes'
        end

        resources 'preorder_conversitions' do
          commentable
          member do
            post :site_confirm
          end
        end

        resources :deliveries, except: [:show]

        catalog_resources_for ProductCatalog, only: [:index]
        resources :market_pages, :concerns => :paginatable

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
      end
    end
  end
end
