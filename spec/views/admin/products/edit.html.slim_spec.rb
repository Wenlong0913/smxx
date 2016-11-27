require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Admin::Product.create!(
      :site => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(@admin_product), "post" do

      assert_select "input#admin_product_site_id[name=?]", "admin_product[site_id]"

      assert_select "input#admin_product_title[name=?]", "admin_product[title]"

      assert_select "textarea#admin_product_description[name=?]", "admin_product[description]"
    end
  end
end
