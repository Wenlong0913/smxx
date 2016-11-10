require 'rails_helper'

RSpec.describe "routing to client", :type => :routing do
  it { expect(get: '/').to route_to('home#index') }
  describe "Session" do
    it { expect(post: '/sign_in').to route_to('users/sessions#create') }
    it { expect(post: '/sign_up').to route_to('users/registrations#create') }
  end
end
