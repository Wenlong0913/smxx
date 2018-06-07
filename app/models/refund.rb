# == Schema Information
#
# Table name: refunds
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  pingpp_charge_id :string
#  event_id         :string
#  order_no         :string
#  description      :text
#  charge           :string
#  amount           :string
#  created          :string
#  charge_order_no  :string
#  succeed          :string
#  status           :string
#  time_succeed     :string
#  failure_code     :string
#  failure_msg      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_id         :integer
#

class Refund < ApplicationRecord
  audited
  belongs_to :order
end
