require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:admin_product, Product.new(
      :name => "MyString",
      :price => 1.5,
      :description => "MyString"
    ))
  end
  it "renders new admin_product form" do
    render
    assert_select "form[action=?][method=?]", admin_products_path, "post" do

      assert_select "input#admin_product_name[name=?]", "admin_product[name]"

      assert_select "input#admin_product_price[name=?]", "admin_product[price]"

      assert_select "input#admin_product_description[name=?]", "admin_product[description]"
    end
  end
end
