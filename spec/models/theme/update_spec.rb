require 'rails_helper'

RSpec.describe 'Theme::Update', type: :model do
  it 'for name' do
    theme = create(:theme)
    flag, theme = Theme::Update.(theme, name: 'new name')
    expect(flag).to be(true)
    expect(theme.name).to be('new name')
  end
  it 'for display_name' do
    theme = create(:theme)
    flag, theme = Theme::Update.(theme, display_name: 'new display name')
    expect(flag).to be(true)
    expect(theme.display_name).to be('new display name')
  end
 end
