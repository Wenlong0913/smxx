# == Schema Information
#
# Table name: market_pages
#
#  id                 :integer          not null, primary key
#  site_id            :integer
#  market_template_id :integer
#  name               :string
#  description        :string
#  features           :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  impressions_count  :integer          default(0)
#  content            :text
#

FactoryGirl.define do
  factory :market_page do
    site nil
    market_template nil
    name "MyString"
    description "MyString"
    features ""
  end
end
