require 'rails_helper'

RSpec.describe "admin/shops/new", type: :view do
  before(:each) do
    assign(:shop, Shop.new(
      :name => "MyString",
      :description => "MyString",
      :content => "MyText",
      :contact_name => "MyString",
      :contact_phone => "MyString",
      :is_published => false,
      :note => "MyText",
      :properties => "MyString",
      :address => "MyString"
    ))
  end
  it "renders new admin_shop form" do
    render
    assert_select "form[action=?][method=?]", admin_shops_path, "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_description[name=?]", "shop[description]"

      assert_select "textarea#shop_content[name=?]", "shop[content]"

      assert_select "input#shop_contact_name[name=?]", "shop[contact_name]"

      assert_select "input#shop_contact_phone[name=?]", "shop[contact_phone]"

      assert_select "input#shop_is_published[name=?]", "shop[is_published]"

      assert_select "textarea#shop_note[name=?]", "shop[note]"

      assert_select "input#shop_properties[name=?]", "shop[properties]"

      assert_select "input#shop_address[name=?]", "shop[address]"
    end
  end
end
