class Teacher
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(Teacher) ? record_or_id : Teacher.find(record_or_id)
      record.destroy
    end
end
