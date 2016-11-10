require 'rails_helper'

RSpec.describe User::Mobile, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_presence_of :phone_number }
  it { should validate_uniqueness_of :user }
  it { should validate_uniqueness_of :phone_number }
end
