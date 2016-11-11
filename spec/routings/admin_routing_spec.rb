require 'rails_helper'

RSpec.describe "routing to admin", :type => :routing do
  it { expect(get: '/admin').to route_to('admin/home#index') }
  it { expect(get: '/admin/sign_in').to route_to('admin/sessions#new') }
end
