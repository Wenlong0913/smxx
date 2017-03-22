class AddressBook < ApplicationRecord
  audited
  belongs_to :user
end
