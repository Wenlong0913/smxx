module AgentBackendRoute
  def self.extended(router)
    router.instance_exec do
      namespace :agent do
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        resources 'sites'
        resources 'products' do
          member do
            post 'process_shelves'
            post 'sales_distribution'
          end
        end
        resources 'orders'
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

        catalog_resources_for ProductCatalog, only: [:index]
        resources :market_pages, :concerns => :paginatable
      end
    end
  end
end
