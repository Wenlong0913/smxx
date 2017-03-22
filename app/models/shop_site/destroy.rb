class ShopSite
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(ShopSite) ? record_or_id : ShopSite.find(record_or_id)
      record.destroy
    end
end
