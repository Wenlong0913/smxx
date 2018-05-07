# == Schema Information
#
# Table name: cms_channels
#
#  id                :integer          not null, primary key
#  site_id           :integer          not null
#  parent_id         :integer
#  title             :string           not null
#  short_title       :string           not null
#  properties        :string
#  tmp_index         :string           not null
#  tmp_detail        :string           not null
#  keywords          :string
#  description       :string
#  image_path        :string
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  impressions_count :integer          default(0)
#

FactoryGirl.define do
  factory :cms_channel, class: 'Cms::Channel' do
    site nil
    parent_id 1
    title "MyString"
    short_title "MyString"
    properties "MyString"
    tmp_index "MyString"
    tmp_detail "MyString"
    keywords "MyString"
    description "MyString"
    image_path "MyString"
    content "MyText"
  end
end
