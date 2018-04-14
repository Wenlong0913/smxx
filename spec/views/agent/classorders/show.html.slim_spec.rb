require 'rails_helper'

RSpec.describe "agent/classorders/show", type: :view do
  before(:each) do
    @classorder = assign(:classorder, Classorder.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
