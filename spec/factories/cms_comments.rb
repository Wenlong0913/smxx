# == Schema Information
#
# Table name: cms_comments
#
#  id           :integer          not null, primary key
#  contact      :string
#  content      :text
#  features     :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  site_id      :integer          not null
#  source_type  :string
#  source_id    :integer
#  user_id      :integer
#  is_published :boolean          default(TRUE)
#

FactoryGirl.define do
  factory :cms_comment, class: 'Cms::Comment' do
    site nil
    contact "MyString"
    content "MyText"
    features ""
  end
end
