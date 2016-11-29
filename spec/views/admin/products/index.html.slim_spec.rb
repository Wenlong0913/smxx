require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:admin_products, [
      Product.create!(
        :name => "Name",
        :price => 2.5,
        :description => "Description"
      ),
      Product.create!(
        :name => "Name",
        :price => 2.5,
        :description => "Description"
      )
    ])
  end
  it "renders a list of admin/products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
