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
        resources 'members'
        resources 'statistics'
        catalog_resources_for ProductCatalog, only: [:index]
        resources 'orders'
      end
    end
  end
end
