Rails.application.routes.draw do
  resources :products do
    favoriteable
  end
  # mount Favorite::Engine => "/favorite"
end
