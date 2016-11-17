Rails.application.routes.draw do
  resources :posts do
    commentable model: Post
  end
end
