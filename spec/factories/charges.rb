<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :charge do
    order nil
    pingpp_charge_id "MyString"
    pingpp_channel "MyString"
    client_ip "MyString"
    pingpp_transaction_no "MyString"
    pingpp_paid false
    pingpp_refunded false
    pingpp_time_paid 1
    pingpp_time_created 1
  end
end
