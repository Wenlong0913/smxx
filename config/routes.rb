Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for "users", skip: [:sessions, :passwords, :registrations], :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  devise_scope :user do
    post 'sign_in', to: 'users/sessions#create'
    post 'sign_out', to: 'users/sessions#destroy'
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
  end

  namespace :agent do
    get '/', to: 'home#index', as: :root
    get 'sign_in', to: 'sessions#new'
  end


end
