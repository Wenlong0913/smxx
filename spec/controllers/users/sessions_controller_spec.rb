require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  it { expect(described_class).to be < Devise::SessionsController }
end
