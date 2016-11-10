require 'rails_helper'

RSpec.describe 'Site::Create', type: :model do
  let(:theme) { create(:theme) }
  let(:user) { create(:user) }
  it 'with valid attributes' do
    attrs = attributes_for(:site).slice(:title, :description)
    attrs.update theme_id: theme.id, user_id: user.id
    flag, site = Site::Create.(attrs)
    expect(flag).to be(true)
    expect(site.title).to be(attrs[:title])
    expect(site.description).to be(attrs[:description])
    expect(site.theme_config.theme).to be(theme)
  end

  it 'without title' do
    attrs = attributes_for(:site).slice(:description)
    attrs.update theme_id: theme.id, user_id: user.id
    flag, _ = Site::Create.(attrs)
    expect(flag).to be(false)
  end

  describe do
    let(:site) { create(:site, theme: theme, user: user) }
    it 'with existing record' do
      site = create(:site, theme_id: theme.id, user_id: user.id)
      flag, _ = Site::Create.(site.attributes.slice(:title, :description))
      expect(flag).to be(false)
    end  
  end
  
end
