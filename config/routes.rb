Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :admin do
    get '/', to: 'home#index', as: :root
  end

  namespace :agent do
    get '/', to: 'home#index', as: :root
  end
end
