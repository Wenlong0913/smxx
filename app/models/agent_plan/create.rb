class AgentPlan
  Create =
    lambda do |attributes, user: nil|
      record = AgentPlan.new(attributes)
      [record.save, record]
    end
end
