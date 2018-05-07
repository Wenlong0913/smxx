# == Schema Information
#
# Table name: forage_run_keys
#
#  id           :integer          not null, primary key
#  date         :date
#  is_processed :string           default("n")
#  processed_at :datetime
#  total_count  :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  source_id    :integer          not null
#

FactoryGirl.define do
  factory :forage_run_key, class: 'Forage::RunKey' do
    source nil
    date "MyString"
    is_processed false
    processed_at "2017-06-21 15:57:28"
    total_count 1
  end
end
