<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: material_managements
#
#  id                    :integer          not null, primary key
#  note                  :string
#  operate_type          :integer
#  operate_date          :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  material_warehouse_id :integer
#  order_code            :string
#  created_by            :string
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :material_management do
    note "MyString"
    type 1
    operate_date "2017-01-05"
  end
end
