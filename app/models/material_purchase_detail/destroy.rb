class MaterialPurchaseDetail
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(MaterialPurchaseDetail) ? record_or_id : MaterialPurchaseDetail.find(record_or_id)
      record.destroy
    end
end
