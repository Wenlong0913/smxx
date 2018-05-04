<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  features   :jsonb
#  is_hot     :boolean          default(FALSE)
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :catalog do
    parent nil
    name "MyString"
    position 1
  end
end
