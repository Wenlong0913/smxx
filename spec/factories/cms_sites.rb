<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: cms_sites
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  template     :string           not null
#  domain       :string
#  description  :string
#  features     :jsonb
#  is_published :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  site_id      :integer
#  root_domain  :string
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :cms_site, class: 'Cms::Site' do
    name "MyString"
    template "MyString"
    domain "MyString"
    description "MyString"
    is_published false
  end
end
