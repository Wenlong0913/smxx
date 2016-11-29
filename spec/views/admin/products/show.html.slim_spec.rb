require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Product.create!(
      :name => "Name",
      :price => 2.5,
      :description => "Description"
    ))
  end
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Description/)
  end
end
