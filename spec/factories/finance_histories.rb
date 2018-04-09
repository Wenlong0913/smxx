# == Schema Information
#
# Table name: finance_histories
#
#  id           :integer          not null, primary key
#  operate_date :date
#  amount       :decimal(8, 2)
#  operate_type :integer
#  owner_type   :string
#  owner_id     :integer
#  created_by   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  features     :jsonb
#

FactoryGirl.define do
  factory :finance_history do
    operate_date "2017-04-05"
    amount "9.99"
    operate_type 1
    owner nil
  end
end
