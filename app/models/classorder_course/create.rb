class ClassorderCourse
  Create =
    lambda do |attributes, user: nil|
      record = ClassorderCourse.new(attributes)
      [record.save, record]
    end
end
