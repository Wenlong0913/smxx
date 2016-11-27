require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:admin_products, [
      Admin::Product.create!(
        :site => nil,
        :title => "Title",
        :description => "MyText"
      ),
      Admin::Product.create!(
        :site => nil,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of admin/products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
