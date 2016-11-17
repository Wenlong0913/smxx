require 'rails_helper'

module Comment
  RSpec.describe Entry, type: :model do
    it 'attributes' do
      expected_attributes = %w(
        id user_id resource_type resource_id content position deleted
        created_at updated_at
      )
      diff = described_class.new.attributes.keys + expected_attributes - (described_class.new.attributes.keys & expected_attributes)
      expect(diff).to be_empty
    end
  end
end
