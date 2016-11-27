require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Admin::Product.create!(
      :site => nil,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
