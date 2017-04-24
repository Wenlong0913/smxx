
Rails.application.routes.draw do

  get 'robots.txt', to: 'robots#index'

  # === Plugins ===
  mount Ckeditor::Engine => '/ckeditor'

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
  resources :image_items, only: [:index, :create, :destroy, :update]

  # file upload
  resources :attachments, only: [:index, :create, :destroy]

  # === Extend partial routes ===
  extend FrontendRoute
  extend ApiRoute
  extend AdminRoute
  extend AgentBackendRoute
  extend AgentFrontendRoute

  extend CmsFrontendRoute
  extend CmsBackendRoute

  extend DocRoute

end
