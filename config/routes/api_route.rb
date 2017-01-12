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
        end
      end
    end
  end
end
