require 'rails_helper'

RSpec.describe "admin/sites/show", type: :view do
  before(:each) do
    @admin_site = assign(:admin_site, Site.create!(
      :user => create(:user),
      :title => "Title",
      :description => "Description"
    ))
  end
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
