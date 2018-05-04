# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  site_id         :integer
#  name            :string
#  features        :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#  name_py         :string
#  catalog_id      :integer
#  comments_count  :integer          default(0)
#  favorites_count :integer          default(0)
#  visits_count    :integer          default(0)
#  likes_count     :integer          default(0)
#  sales_count     :integer          default(0)
#  forage          :jsonb
#

class Vendor < Item
  store_accessor :features, :contact_name, :phone_number
  has_many :vendor_relations
  audited

  # 供应商只能够属于公司
  after_initialize do
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.site_id = Site::MAIN_ID
  end
end
