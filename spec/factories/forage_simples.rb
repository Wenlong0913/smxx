# == Schema Information
#
# Table name: forage_simples
#
#  id           :integer          not null, primary key
#  catalog      :string
#  title        :string
#  url          :string           not null
#  features     :jsonb
#  is_processed :string           default("n")
#  processed_at :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  run_key_id   :integer          not null
#

FactoryGirl.define do
  factory :forage_simple, class: 'Forage::Simple' do
    run_key nil
    catalog "MyString"
    title "MyString"
    url "MyString"
    features ""
    is_processed false
    processed_at "MyString"
  end
end
