module ApiRoute
  def self.extended(router)
    router.instance_exec do
      namespace :api do
        get '/', to: "home#index"
        namespace :v1 do
          namespace :sessions do
            resource :sms, only: [:create]
          end
          resources :sessions, only: [:create]
          resources :materials, only: [:index, :create, :update]
          resources :orders, only: [:index]
          resources :material_management_details, only: [:index, :create]
          resources :material_managements, only: [:create]
          resources :material_warehouses, only: [:index]
          resources :material_stock_alerts, only: [:index]
          resources :material_catalogs, only: [:index]
          resources :produces, only: [:index, :create]
          resources :image_items, only: [:create]
          resources :sites, only: [:index]
        end
      end
    end
  end
end
