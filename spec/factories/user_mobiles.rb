FactoryGirl.define do
  factory :user_mobile, class: 'User::Mobile' do
    user
    phone_number '139123456789'
  end
end
