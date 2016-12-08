require 'rails_helper'

RSpec.describe "admin/sites/edit", type: :view do
  before(:each) do
    @admin_site = assign(:admin_site, Site.create!(
      :user => nil,
      :title => "MyString",
      :description => "MyString"
    ))
  end
  it "renders the edit admin_site form" do
    render
    assert_select "form[action=?][method=?]", admin_site_path(@admin_site), "post" do

      assert_select "input#admin_site_user_id[name=?]", "admin_site[user_id]"

      assert_select "input#admin_site_title[name=?]", "admin_site[title]"

      assert_select "input#admin_site_description[name=?]", "admin_site[description]"
    end
  end
end
