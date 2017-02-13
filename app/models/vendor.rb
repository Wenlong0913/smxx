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
