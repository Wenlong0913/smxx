# == Schema Information
#
# Table name: sites
#
<<<<<<< HEAD
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
=======
#  id                    :integer          not null, primary key
#  user_id               :integer
#  title                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  features              :jsonb
#  type                  :string
#  address_alias_id      :integer
#  address_line          :string
#  catalog_id            :integer
#  favorites_count       :integer          default(0)
#  visits_count          :integer          default(0)
#  comments_count        :integer
#  agent_plan_id         :integer
#  paid_at               :datetime
#  is_flatform_recommend :boolean          default(FALSE)
#  lng                   :decimal(20, 14)
#  lat                   :decimal(20, 14)
#  forage                :jsonb
#  parent_id             :integer
#  tanmer_wxopen_token   :string
>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
#

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
