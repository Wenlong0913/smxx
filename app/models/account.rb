class Account < ApplicationRecord
  audited
  belongs_to :owner, polymorphic: true
end
