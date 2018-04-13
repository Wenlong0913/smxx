class Refund < ApplicationRecord
  audited
  belongs_to :order
  belongs_to :classorder
end
