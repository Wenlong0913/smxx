require 'rails_helper'

RSpec.describe 'Site::Update', type: :model do
  it 'for title' do
    theme = create(:theme)
    site = create(:site, theme: theme)
    flag, new_site = Site::Update.(site, title: 'new title')
    expect(flag).to be(true)
    expect(new_site.title).to be(site.title)
  end

  it 'for description' do
    theme = create(:theme)
    site = create(:site, theme: theme)
    flag, new_site = Site::Update.(site, description: 'new description')
    expect(flag).to be(true)
    expect(new_site.description).to be(site.description)
  end

  it 'with existing record' do
    site = create(:site)
    site2 = create(:site2)
    flag, _ = Site::Update.(site, site2.attributes.slice(:title, :description))
    expect(flag).to be(false)
  end
end
