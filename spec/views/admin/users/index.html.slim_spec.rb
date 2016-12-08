require 'rails_helper'

RSpec.describe "admin/users/index", type: :view do
  before(:each) do
    assign(:admin_users, [
      create(:user),
      create(:admin)
    ])
  end
  it "renders a list of admin/users" do
    render
  end
end
