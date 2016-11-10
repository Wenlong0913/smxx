require 'rails_helper'

RSpec.describe 'Theme::Destroy', type: :model do
  it 'success' do
    theme = create(:theme)
    flag, _ = Theme::Destroy.(theme)
    expect(flag).to be(true)
    expect(Theme.exists?(theme.id)).to be(false)
  end
end
