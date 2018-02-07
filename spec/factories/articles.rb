# == Schema Information
#
# Table name: articles
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  author                :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  comments_count        :integer
#  likes_count           :integer
#  community_id          :integer
#  valid_time_begin      :date
#  valid_time_end        :date
#  article_type          :integer
#  is_top                :boolean          default(FALSE)
#  source_type           :string
#  source_id             :integer
#  complaints_count      :integer          default(0)
#  is_complainted        :boolean          default(FALSE)
#  is_flatform_recommend :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :article do
    title "MyString"
    description "MyText"
  end
end
