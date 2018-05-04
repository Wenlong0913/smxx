<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: cms_pages
#
#  id                :integer          not null, primary key
#  channel_id        :integer          not null
#  title             :string           not null
#  short_title       :string           not null
#  keywords          :string
#  description       :string
#  image_path        :string
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  properties        :string           default([]), is an Array
#  impressions_count :integer          default(0)
#  comments_count    :integer          default(0)
#  forage            :jsonb
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :cms_page, class: 'Cms::Page' do
    channel nil
    title "MyString"
    short_title "MyString"
    properties "MyString"
    keywords "MyString"
    description "MyString"
    image_path "MyString"
    content "MyText"
  end
end
