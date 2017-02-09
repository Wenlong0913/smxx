module AgentRoute
  def self.extended(router)
    router.instance_exec do
      namespace :agent do
        get '/', to: 'home#index', as: :root
        get 'sign_in', to: 'sessions#new'
        resources 'products'
        resources 'members'
        resources 'statistics'
        catalog_resources_for ProductCatalog, only: [:index]
      end
    end
  end
end
