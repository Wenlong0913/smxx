<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: market_templates
#
#  id           :integer          not null, primary key
#  catalog_id   :integer          not null
#  base_path    :string           not null
#  name         :string           not null
#  keywords     :string
#  description  :string
#  image_path   :string
#  html_source  :text
#  form_source  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(TRUE)
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :market_template do
    market_catalog nil
    base_path "MyString"
    name "MyString"
    keywords "MyString"
    description "MyString"
    image_path "MyString"
    html_source "MyText"
    form_source "MyText"
  end
end
