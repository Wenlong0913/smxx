require 'rails_helper'

RSpec.describe "routing to agent", :type => :routing do
  it { expect(get: '/agent').to route_to('agent/home#index') }
end
