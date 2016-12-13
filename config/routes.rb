Rails.application.routes.draw do

  # image upload
  resources :image_items, only: [:index, :create]

  concern :paginatable do
    get '(page-:page)', :action => :index, :on => :collection, :as => ''
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for "users", skip: [:sessions, :passwords, :registrations], :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  devise_scope :user do
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
    resources :products
  end

  namespace :agent do
    get '/', to: 'home#index', as: :root
    get 'sign_in', to: 'sessions#new'
  end


end
