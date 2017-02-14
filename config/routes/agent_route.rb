module AgentRoute
  def self.extended(router)
    router.instance_exec do
      namespace :agent do
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        resources 'products' do
          member do
            post 'process_shelves'
          end
        end
        resources 'orders'
        resources 'statistics'

        resources 'members' do
          resources 'member_notes'
        end

        resources 'orders_designs' do
          commentable
        end

        catalog_resources_for ProductCatalog, only: [:index]
        resources :market_pages, :concerns => :paginatable do
          member do
            get 'preview'
          end
        end
      end
    end
  end
end
