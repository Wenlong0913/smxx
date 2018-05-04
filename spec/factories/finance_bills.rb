<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :finance_bill do
    amount ""
    amount ""
    status 1
  end
end
