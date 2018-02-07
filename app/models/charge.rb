# == Schema Information
#
# Table name: charges
#
#  id               :integer          not null, primary key
#  order_id         :integer
#  pingpp_charge_id :string
#  channel          :string
#  client_ip        :string
#  transaction_no   :string
#  paid             :string
#  refunded         :string
#  time_paid        :string
#  time_created     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Charge < ApplicationRecord
  audited
  belongs_to :order
end
