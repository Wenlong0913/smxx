class Teacher
  Create =
    lambda do |attributes, user: nil|
      record = Teacher.new(attributes)
      [record.save, record]
    end
end
