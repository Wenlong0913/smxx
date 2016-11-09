require 'rails_helper'

RSpec.describe Theme, type: :model do
  it 'is valid with valid attributes'
  it 'is not valid without name'
  it 'is not valid without display_name'
  it { should have_many :theme_configs }
  it { should have_many :sites }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
