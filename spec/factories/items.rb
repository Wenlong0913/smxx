<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  site_id         :integer
#  name            :string
#  features        :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#  name_py         :string
#  catalog_id      :integer
#  comments_count  :integer          default(0)
#  favorites_count :integer          default(0)
#  visits_count    :integer          default(0)
#  likes_count     :integer          default(0)
#  sales_count     :integer          default(0)
#  forage          :jsonb
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :item do
    name "MyString"
    features ""
  end
end
