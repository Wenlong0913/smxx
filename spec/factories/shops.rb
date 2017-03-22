FactoryGirl.define do
  factory :shop do
    user nil
    name "MyString"
    description "MyString"
    content "MyText"
    contact_name "MyString"
    contact_phone "MyString"
    is_published false
    note "MyText"
    properties "MyString"
    features "MyString"
    impressions_count 1
  end
end
