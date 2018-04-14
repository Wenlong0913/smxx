# == Schema Information
#
# Table name: finance_bills
#
#  id         :integer          not null, primary key
#  amount     :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#  is_entry   :boolean          default(FALSE)
#  site_id    :integer
#

FactoryGirl.define do
  factory :finance_bill do
    amount ""
    amount ""
    status 1
  end
end
