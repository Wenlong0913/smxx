<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: account_histories
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  amount           :decimal(8, 2)
#  relation_account :integer
#  relation_type    :integer
#  relation_date    :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :account_history do
    account nil
    amount "9.99"
    relation_account 1
    relation_type 1
    relation_date "2017-02-07"
  end
end
