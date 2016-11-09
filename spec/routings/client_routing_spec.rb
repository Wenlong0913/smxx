require 'rails_helper'

RSpec.describe "routing to client", :type => :routing do
  it { expect(get: '/').to route_to('home#index') }
end
