class Task
  Create =
    lambda do |attributes, user: nil|
      produce = Produce.where(id: attributes[:produce_id]).first
      attributes.delete(:produce_id)
      record = produce ? produce.tasks.new(attributes) : Task.new(attributes)
      [record.save, record]
    end
end
