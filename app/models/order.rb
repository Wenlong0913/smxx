class Order < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :site
end
