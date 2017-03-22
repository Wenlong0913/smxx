require 'rails_helper'

RSpec.describe "admin/shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.new(id: 1,
      :name => "Name",
      :description => "Description",
      :content => "MyText",
      :contact_name => "Contact Name",
      :contact_phone => "Contact Phone",
      :is_published => false,
      :note => "MyText",
      :properties => "Properties",
      :address => "Address"
    ))
  end
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Properties/)
    expect(rendered).to match(/Address/)
  end
end
