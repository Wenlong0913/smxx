Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for "users", skip: [:sessions]
  as :user do
    post 'sign_in', to: 'users/sessions#create', as: :sign_in
    post 'sign_up', to: 'users/registrations#create', as: :sign_up
  end

  namespace :admin do
    get '/', to: 'home#index', as: :root
  end

  namespace :agent do
    get '/', to: 'home#index', as: :root
  end


end
