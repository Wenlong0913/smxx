module CmsBackendRoute
  def self.extended(router)
    router.instance_exec do
      namespace :cms do
        resources :sites do
          resources :channels do
            resources :pages
          end
        end
      end
    end
  end
end
