require 'rails_helper'

RSpec.describe "routing to admin", :type => :routing do
  it { expect(get: '/admin').to route_to('admin/home#index') }
end
