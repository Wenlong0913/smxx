require 'rails_helper'

RSpec.describe "routing to client", :type => :routing do
  it { expect(get: '/').to route_to('home#index') }
  describe "Session" do
    it { expect(post: '/sign_in').to route_to('users/sessions#create') }
    it { expect(post: '/sign_out').to route_to('users/sessions#destroy') }
    it { expect(post: '/sign_up').to route_to('users/registrations#create') }
    it { expect(get: '/users/auth/wechat').to route_to('users/omniauth_callbacks#passthru') }
    it { expect(post: '/users/auth/wechat').to route_to('users/omniauth_callbacks#passthru') }
    it { expect(get: '/users/auth/wechat/callback').to route_to('users/omniauth_callbacks#wechat') }
    it { expect(post: '/users/auth/wechat/callback').to route_to('users/omniauth_callbacks#wechat') }
  end
end
