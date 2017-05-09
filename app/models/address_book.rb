class AddressBook < ApplicationRecord
  audited
  belongs_to :user
  store_accessor :features, :full_address
end
