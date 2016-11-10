FactoryGirl.define do
  factory :site do
    id 1
    title 'Site 1'
    description 'MyDescription'
    factory :site2 do
      id 2
      title 'Site 2'
      description 'MyDescription2'
    end
  end
end
