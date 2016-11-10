require 'rails_helper'

RSpec.describe 'Theme::Update', type: :model do

  let(:theme) { create(:theme) }

  it 'for name' do
    flag, theme = Theme::Update.(theme, name: 'new name')
    expect(flag).to be(true)
    expect(theme.name).to be('new name')
  end

  it 'with existing name' do
    theme2 = create(:theme2)
    flag, theme = Theme::Update.(theme, name: theme2.name)
    expect(flag).to be(false)
  end

  it 'for display_name' do
    flag, theme = Theme::Update.(theme, display_name: 'new display name')
    expect(flag).to be(true)
    expect(theme.display_name).to be('new display name')
  end

  it 'with existing display_name' do
    theme2 = create(:theme2)
    flag, theme = Theme::Update.(theme, display_name: theme2.display_name)
    expect(flag).to be(false)
  end

 end
