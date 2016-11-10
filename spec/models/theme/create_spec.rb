require 'rails_helper'

RSpec.describe 'Theme::Create', type: :model do
  it 'with valid attributes' do
    theme = build(:theme)
    flag, new_theme = Theme::Create.(theme.attributes.slice(:name, :display_name))
    expect(flag).to be(true)
    expect(new_theme.name).to be(theme.name)
    expect(new_theme.display_name).to be(theme.display_name)
  end

  it 'faild without name' do
    theme = build(:theme)
    flag, new_theme = Theme::Create.(theme.attributes.slice(:display_name))
    expect(flag).to be(false)
  end

  it 'faild without display_name' do
    theme = build(:theme)
    flag, new_theme = Theme::Create.(theme.attributes.slice(:name))
    expect(flag).to be(false)
  end
end
