module API::V1
  class User < Grape::API
    resources :users do
      desc 'Ping status'
      get :ping do
        [3, Time.now]
      end
    end
  end
end
