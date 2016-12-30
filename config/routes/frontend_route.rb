module FrontendRoute
  def self.extended(router)
    router.instance_exec do
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
    end
  end
end
