Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # For CMS Backend
  namespace :cms do
    resources :sites do
      resources :channels do
        resources :pages
      end
    end
  end
  # For CMS frontend
  match '/cms_:site/search(/:search(/page/:page))', to: "cms#search", via: :get, as: 'search'
  #match '/tag/:tag(/page/:page)', to: "cms#tag", as: 'tag', via: :get
  match '/cms_:site(/:channel(/:id))', to: "cms#index", via: :get
  match '/cms_:site/:channel(/page/:page)', to: "cms#index", via: :get

  concern :paginatable do
    get '(page-:page)', :action => :index, :on => :collection, :as => ''
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for "users", skip: [:sessions, :passwords, :registrations], :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  devise_scope :user do
    post '/sessions/:id/impersonate', to: 'users/sessions#impersonate', as: :impersonate_session
    post '/sessions/stop_impersonating', to: 'users/sessions#stop_impersonating', as: :stop_impersonating_sessions
    post 'sign_in', to: 'users/sessions#create'
    delete 'sign_out', to: 'users/sessions#destroy'
    post 'sign_up', to: 'users/registrations#create'
    get  'sign_up', to: 'users/registrations#new'
  end

  namespace :api do
    get '/', to: "home#index"
    namespace :v1 do
      namespace :sessions do
        resource :sms, only: [:create]
      end
    end
  end

  namespace :admin do
    get "/static_pages/*id" => 'static_pages#show', as: :page, format: false
    get '/', to: 'home#index', as: :root
    get 'sign_in', to: 'sessions#new'
    namespace :tracker do
      get '/', to: 'home#index'
      namespace :visits do
        resource :statistics, only: [:show]
        resource :details, only: [:show]
      end
      namespace :shares do
        get '/', to: 'home#show'
      end
    end
    resources :roles, only: [:index], :concerns => :paginatable do
      resources :users, only: [:index], :concerns => :paginatable
    end
    resources :users, :concerns => :paginatable
    resources :products, :concerns => :paginatable
    resources :sites, :concerns => :paginatable
  end

  namespace :agent do
    get '/', to: 'home#index', as: :root
    get 'sign_in', to: 'sessions#new'
  end


end
