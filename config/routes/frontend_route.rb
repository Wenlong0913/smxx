require 'root_domain'
module FrontendRoute
  def self.extended(router)
    router.instance_exec do
      constraints(RootDomain) do
        root to: redirect('/', subdomain: 'www')
      end
      devise_for "users", skip: [:sessions, :passwords, :registrations], :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
      devise_scope :user do
        post '/sessions/:id/impersonate', to: 'users/sessions#impersonate', as: :impersonate_session
        post '/sessions/stop_impersonating', to: 'users/sessions#stop_impersonating', as: :stop_impersonating_sessions
        post 'sign_in', to: 'users/sessions#create'
        delete 'sign_out', to: 'users/sessions#destroy'
        post 'sign_up', to: 'users/registrations#create'
        get  'sign_up', to: 'users/registrations#new'
      end

      # 微信注册／登录
      namespace :users do
        namespace :weixins do
          resource :registrations, only: [:new, :show]
          resource :sessions, only: [:new] do
            collection do
              post 'status'
              get 'login'
            end
          end
          resource :connects, only: [:new, :create] do
            collection do
              post "status"
              get "confirm"
            end
          end
        end
      end

      if Rails.env.development?
        get '/test-room', to: 'test_room#index'
        post '/test-room', to: 'test_room#create'
        delete '/test-room/:id', to: 'test_room#destroy'
      end

      # 前端页面路由
      resource :users, except: [:create, :destroy, :new], controller: 'frontend/users' do
        get "self_order"
        get "self_comment"
        get "self_complaint"
        post "self_complaint"
        get "self_message"
        get "binding_phone"
        get "binding_weixin"
        post "binding_weixin"
        post "binding_phone"
      end

      namespace :frontend do
        get 'home/index'
        match 'share/(:class/:id)', to: "share#index", via: :get

        resources :orders do
          collection do
            get "search"
            post "do_search"
            get "search_result"
            post "charge"
          end
          member do
            get :paid_success
          end
        end

        resources :communites
        resources :sites do
          commentable
        end
        resources :site_catalogs do
          resources :sites
        end
        resources :products do
          commentable
        end
        resources :product_catalogs do
          resources :products
        end

      end
    end
  end
end
