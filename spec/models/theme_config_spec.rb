require 'rails_helper'

RSpec.describe ThemeConfig, type: :model do
  it { should belong_to :site }
  it { should belong_to :theme }
  it { should validate_presence_of :theme }
  it { should validate_presence_of :site }
  it { should validate_uniqueness_of :site }

  it 'is valid with valid attributes'
  it 'is not valid without theme'
  it 'is not valid without site'
  it 'is not valid with existing site'
end
