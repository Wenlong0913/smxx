<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: orders
#
#  id                       :integer          not null, primary key
#  code                     :string
#  user_id                  :integer
#  site_id                  :integer
#  price                    :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  description              :text
#  status                   :integer
#  internal_status          :integer
#  member_id                :integer
#  preorder_conversition_id :integer
#  create_by                :integer
#  update_by                :integer
#  resource_url             :string
#  delivery_date            :date
#  finance_bill_id          :integer
#  refund_status            :integer
#  apply_refund_by          :integer
#  refund_description       :text
#  comments_count           :integer          default(0)
#  features                 :jsonb
#  deleted                  :boolean          default(FALSE)
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :order do
    code "MyString"
    user nil
    site nil
    price 1
  end
end
