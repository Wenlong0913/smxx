class ClassorderCourse
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(ClassorderCourse) ? record_or_id : ClassorderCourse.find(record_or_id)
      record.destroy
    end
end
