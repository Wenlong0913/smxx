require 'rails_helper'

RSpec.describe "admin/sites/new", type: :view do
  before(:each) do
    assign(:admin_site, Site.new)
  end
  it "renders new admin_site form" do
    render
    assert_select "form[action=?][method=?]", admin_sites_path, "post" do

      assert_select "select#admin_site_user_id[name=?]", "admin_site[user_id]"

      assert_select "input#admin_site_title[name=?]", "admin_site[title]"

      assert_select "input#admin_site_description[name=?]", "admin_site[description]"
    end
  end
end
