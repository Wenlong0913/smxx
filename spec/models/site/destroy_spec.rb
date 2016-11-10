require 'rails_helper'

RSpec.describe 'Site::Destroy', type: :model do
  it do
    site = create(:site)
    flag, _ = Site::Destroy.(site)
    expect(flag).to be(true)
    expect(Site.exists?(site.id)).to be(false)
  end
end
