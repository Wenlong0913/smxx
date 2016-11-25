# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  title       :string
#  short_title :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :page do
    title 'Title1'
  end
end
