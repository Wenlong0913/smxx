module CmsFrontendRoute
  def self.extended(router)
    router.instance_exec do
      concern :paginatable2 do
        get '(page-:page)', :as => ''
      end
      scope path: '/cms-:site', as: :cms_frontend do
        get '', to: 'cms#index', as: :root
        get '/search', to: 'cms#search', as: :search
        get '/:channel(/pages/:page)', to: 'cms#channel', as: :channel
        get '/:channel/:id', to: 'cms#page', as: :page
      end

      constraints(Subdomain) do
        match '/' => 'cms#index', via: [:get, :post]
      end

    end
  end
end
