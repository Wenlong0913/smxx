module DocRoute
  def self.extended(router)
    router.instance_exec do
      get :docs, to: 'docs#index', as: :doc_root
      get "/docs/(:page)", to: 'docs#index', as: :doc, constraints: { page: /[^\/]+\.md/ }
    end
  end
end
