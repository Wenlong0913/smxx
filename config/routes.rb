Rails.application.routes.draw do

  namespace :admin do
    get 'order_deliveries/index'
  end

  # === Common methods ===
  def catalog_resources_for(klass, options = {})
    resources klass.name.underscore.pluralize, options.merge(controller: 'catalogs', klass: klass.name)
  end

  # === Common concerns ===
  concern :paginatable do
    get '(page-:page)', :action => :index, :on => :collection, :as => ''
  end

  # === Common routes ===

  # image upload
  resources :image_items, only: [:index, :create, :destroy]

  # file upload
  resources :attachments, only: [:index, :create, :destroy]

  # === Extend partial routes ===

  # Grape API
  constraints subdomain: 'api' do
    mount AppAPI::Root => '/'
    if Rails.env.development?
      mount GrapeSwaggerRails::Engine => '/'
    else
      root to: redirect('/not_found')
    end
  end

  extend FrontendRoute
  extend ApiRoute
  extend AdminRoute
  extend AgentBackendRoute
  extend AgentFrontendRoute

  extend CmsFrontendRoute
  extend CmsBackendRoute

  extend DocRoute

  # === Plugins ===
  mount Ckeditor::Engine => '/ckeditor'
end
