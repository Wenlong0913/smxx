# == Schema Information
#
# Table name: forage_details
#
#  id            :integer          not null, primary key
#  url           :string           not null
#  migrate_to    :string
#  can_purchase  :boolean          default(FALSE)
#  purchase_url  :string
#  title         :string
#  keywords      :string
#  image         :string
#  description   :string
#  content       :text
#  date          :string
#  time          :string
#  address_line1 :string
#  address_line2 :string
#  phone         :string
#  price         :string
#  from          :string
#  has_site      :boolean          default(FALSE)
#  site_name     :string
#  note          :string
#  features      :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  simple_id     :integer          not null
#  is_merged     :string           default("n")
#

FactoryGirl.define do
  factory :forage_detail, class: 'Forage::Detail' do
    simple nil
    url "MyString"
    migrate_to "MyString"
    can_purchase false
    purchase_url "MyString"
    title "MyString"
    keywords "MyString"
    image "MyString"
    description "MyString"
    content "MyString"
    date "MyString"
    time "MyString"
    address_line1 "MyString"
    address_line2 "MyString"
    phone "MyString"
    price "MyString"
    from "MyString"
    has_site false
    site_name "MyString"
    note "MyString"
    features ""
  end
end
