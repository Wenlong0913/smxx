class MaterialPurchase
  Update =
    lambda do |record_or_id, attributes, user: nil|
      record = record_or_id.is_a?(MaterialPurchase) ? record_or_id : MaterialPurchase.find(record_or_id)
      record.assign_attributes attributes
      record.amount = record.material_purchase_details.map{|mpd| mpd.number * mpd.price }.sum
      record.total = record.material_purchase_details.map{|mpd| mpd.number }.sum
      [record.save, record]
    end
end