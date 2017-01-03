class Member
  Create =
    lambda do |attributes, user: nil|
      attributes[:gender] = 'secret'if attributes[:gender]
      record = Member.new(attributes)
      [record.save, record]
    end
end
