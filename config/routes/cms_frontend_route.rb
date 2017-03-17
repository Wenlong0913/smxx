require 'cms_subdomain'
module CmsFrontendRoute
  def self.extended(router)
    router.instance_exec do
      concern :paginatable2 do
        get '(page-:page)', :as => ''
      end

      constraints(CmsSubdomain) do
        scope as: :cms_frontend do
          root :to => "cms#index"
          match '/search(/:search(/page/:page))', to: "cms#search", via: :get, as: 'search'
          match '/tag/:tag(/page/:page)', to: "cms#tag", as: 'tag', via: :get
          match '/:channel(/:id)', to: "cms#index", via: :get
          match '/:channel(/page/:page)', to: "cms#index", via: :get
        end
      end

    end
  end
end
