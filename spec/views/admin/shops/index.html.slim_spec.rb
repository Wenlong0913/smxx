require 'rails_helper'

RSpec.describe "admin/shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.new(id: 1,
        :name => "Name",
        :description => "Description",
        :content => "MyText",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :is_published => false,
        :note => "MyText",
        :properties => "Properties",
        :address => "Address"
      ),
      Shop.new(id: 2,
        :name => "Name",
        :description => "Description",
        :content => "MyText",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :is_published => false,
        :note => "MyText",
        :properties => "Properties",
        :address => "Address"
      )
    ])
  end
  it "renders a list of admin/shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Properties".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
